# EditorConfig is awesome: https://EditorConfig.org

# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

[*.yaml]
trim_trailing_whitespace = false
indent_size = 2

[*.yml]
trim_trailing_whitespace = false
indent_size = 2

[*{.md,.js}]
indent_style = space

[*.html]
trim_trailing_whitespace = false
indent_size = 2

[*.js]
trim_trailing_whitespace = true
indent_size = 2

[*.scss]
trim_trailing_whitespace = true
indent_size = 2

[*.json]
trim_trailing_whitespace = true
>>>>>>> 317cdc9c14d97f5e0485a09696ee92eefe38b517
indent_size = 2

[{package.json,.travis.yml}]
indent_style = space
indent_size = 2

# Tab indentation (no size specified)
[Makefile]
indent_style = tab
