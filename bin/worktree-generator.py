import re
import subprocess
import shutil
from pathlib import Path


def create_branch_name():
    while True:
        devops_id = input("Please enter the DevOps ID: ")
        if devops_id.isdigit():
            break
        else:
            print("That doesn't look like a valid ID. Please enter a number guy.")

    task_name = input("Please enter the full task description: ")
    name_cleaned = re.sub(r"\([^)]*\)|\[[^\]]*\]|\{[^}]*\}", "", task_name)
    name_lower = name_cleaned.lower()
    name_no_punctuation = re.sub(r"[^a-z0-9\s]", " ", name_lower)
    name_hyphenated = re.sub(r"\s+", "-", name_no_punctuation)
    name_final = name_hyphenated.strip("-")

    final_branch_name = f"{devops_id}-{name_final}"
    return final_branch_name


def setup_worktree(branch_name):
    current_dir = Path.cwd()
    worktree_path = current_dir.parent / branch_name

    print(f"\nCreating worktree at: {worktree_path}")

    # 1. Run the Git command to create the worktree
    try:
        subprocess.run(
            ["git", "worktree", "add", str(worktree_path), "-b", branch_name],
            check=True,
        )
    except subprocess.CalledProcessError:
        print("Failed to create git worktree. Does the branch already exist?")
        return

    # 2. Define the files and folders (Source -> Destination)

    files_to_copy = {
        current_dir / ".env": worktree_path / ".env",
        current_dir / "config.json": worktree_path / "config.json",
        current_dir / "AGENTS.md": worktree_path / "AGENTS.md",
    }

    backend_source = Path("~/Dev/Work/backend").expanduser()
    backend_dest = worktree_path / "backend"

    try:
        backend_dest.symlink_to(backend_source)
        print("Linked: backend")
    except FileExistsError:
        print("backend link already exists.")

    # 3. Copy the files
    for source, destination in files_to_copy.items():
        try:
            if source.exists():
                shutil.copy2(source, destination)
                print(f"Copied: {source.name}")
            else:
                print(f"Warning: Source file {source.name} not found. Skipping.")
        except Exception as e:
            print(f"Error copying {source.name}: {e}")


if __name__ == "__main__":
    branch = create_branch_name()
    setup_worktree(branch)
    print(f"\nDone! You can now 'cd' into ../{branch}")
