from rich.console import Console
from rich.markdown import Markdown

console = Console()
with open("test.md") as readme:
    markdown = Markdown(readme.read())
console.print(markdown)
