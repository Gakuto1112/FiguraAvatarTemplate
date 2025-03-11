Language: 　**English**　|　[日本語](./README_jp.md)

# FiguraAvatarTemplate
This is a template repository for [Figura](https://modrinth.com/mod/figura),  skin mod for [Minecraft](https://www.minecraft.net/en-us).

## Repository structure
### avatar.json
The meta file for the avatar. Figura won't recognize this repository as an avatar if this file doesn't exist. On the contrary, Figura will recognize this repository as an avatar even if only this file exists. Please see [this](https://wiki.figuramc.org/tutorials/Avatar%20Metadata) for more information.

### avatar.png
The thumbnail for the avatar. Shown in the avatar list.

### models
The directory to store avatar models. They are created with [Blockbench](https://www.blockbench.net/).

### textures
The directory to store textures of avatar models.
The png textures contained here will be compressed by [Github Actions](https://github.co.jp/features/actions), reducing the file size by 50% to 75%.
If you do not need texture compression, please remove `.github/workflows/compress_textures.yml`.

### scripts
The directory to store scripts. The language for them is Lua. Please see [this](https://applejuiceyy.github.io/figs/) for about the Lua API provided by Figura. In addition, explanations of the sample scripts are described in the script files.

### .github
The directory to store README files, workflow files for Github Actions, and etc. The directory is not related to the avatar.

### .gitignore
The list of files/directories to exclude from the [Git](https://git-scm.com/) management system. The file is not related to the avatar.

## Editing README
READMEs are generated from `.github/README_templates` to `.github/README.md` and `.github/README_jp.md` by Github Actions. Please edit READMEs under `.github/README_templates` and don't edit `.github/README.md` and `.github/README_jp.md` because changing files under `.github/README_templates` will trigger Github Actions and it overrides `.github/README.md` and `.github/README_jp.md`. And, please don't delete any files under `.github/README_templates`. If you delete them, Github Actions will result in an error.

Please put images under `.github/README_images` if you want to add images in the README (e.g., `![The image](./README_images/image.jpg)`). Images outside `.github/README_images` won't be processed by Github Actions (Image urls may be invalid when generating READMEs).

There are some template phrases which are automatically inserted by Github Actions. Please see [this](https://github.com/Gakuto1112/FiguraAvatarsReadmeTemplate) for more information.

## Things to do after creating a new avatar
1. Add a new repository variable as `TARGET_BRANCHES` and define an array of branches for which READMEs are to be generated (e.g., `["Senko", "Shiro", "Suzu"]`).
2. Add the new avatar repository to the repository variable `TARGET_REPOSITORIES` in the repository "FiguraAvatarsReadmeTemplate" (for Gakuto1112 only).

## Things to do after adding a new avatar branch
1. Add the added avatar branch to `on`->`push`->`branches` in `.github/workflows/generate_readme.yml`.
   - You can specify avatar branches easier with wildcards.
2. Add the added avatar branch to repository variable `TARGET_BRANCHES` of this repository.
