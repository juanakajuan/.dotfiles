import re


def create_branch_name():
    """
    Prompts the user for a DevOps ID and a task name,
    and then converts them into a clean, standardized branch name,
    ignoring any text inside parentheses, brackets, or braces.
    """

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

    print(f"Branch Name: {final_branch_name}")


if __name__ == "__main__":
    create_branch_name()
