ANSI_RESET = "\033[m"
ANSI_BRIGHT_RED = "\033[91m"
ANSI_BRIGHT_GREEN = "\033[92m"
ANSI_BRIGHT_YELLOW = "\033[93m"
ANSI_BRIGHT_BLUE = "\033[94m"
ANSI_CURSOR_PREVIOUS_LINE = "\033[F"
ANSI_ERASE_IN_LINE = "\033[K"


def print_red(message: str) -> None:
    print(f"{ANSI_BRIGHT_RED}{message}{ANSI_RESET}")


def print_green(message: str) -> None:
    print(f"{ANSI_BRIGHT_GREEN}{message}{ANSI_RESET}")


def print_yellow(message: str) -> None:
    print(f"{ANSI_BRIGHT_YELLOW}{message}{ANSI_RESET}")


def print_blue(message: str) -> None:
    print(f"{ANSI_BRIGHT_BLUE}{message}{ANSI_RESET}")
