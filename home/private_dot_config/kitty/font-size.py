from pathlib import Path

heights = (
    int(size.read_text().split(",")[1])
    # Each file contains `width,height`, e.g. `2560,1440`.
    for size in Path("/sys/class/graphics").glob("*/virtual_size")
)

height = max(heights, default=1080)

if height <= 800:
    font_size = 9
elif height <= 1080:
    font_size = 13
else:
    font_size = 17

print(f"font_size {font_size}")
