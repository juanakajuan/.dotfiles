import re
import subprocess
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

    # 2. Define the symlinks (Target -> Where the link goes)
    # Use .expanduser() to handle the '~' in your backend path
    links = {
        Path("~/Dev/Work/backend").expanduser(): worktree_path / "backend",
        current_dir / ".env": worktree_path / ".env",
        current_dir / "config.json": worktree_path / "config.json",
        current_dir / "AGENTS.md": worktree_path / "AGENTS.md",
    }

    # 3. Create the symlinks
    for target, link_location in links.items():
        try:
            link_location.symlink_to(target)
            print(f"Linked: {link_location.name}")
        except FileExistsError:
            print(f"{link_location.name} already exists, skipping link.")
        except Exception as e:
            print(f"Error linking {link_location.name}: {e}")


if __name__ == "__main__":
    branch = create_branch_name()
    setup_worktree(branch)
    print(f"\nDone! You can now 'cd' into ../{branch}")
