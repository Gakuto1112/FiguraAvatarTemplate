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

### scripts
The directory to store scripts. The language for them is Lua. Please see [this](https://applejuiceyy.github.io/figs/) for about the Lua API provided by Figura.

### .github
The directory to store README files, workflow files for [Github Actions](https://github.co.jp/features/actions), and etc. The directory is not related to the avatar.

### .gitignore
The list of files/directories to exclude from the [Git](https://git-scm.com/) management system. The file is not related to the avatar.

## Editing README
READMEs are generated from `.github/README_templates` to `.github/README.md` and `.github/README_jp.md` by [Github Actions](https://github.co.jp/features/actions). Please edit READMEs under `.github/README_templates` and don't edit `.github/README.md` and `.github/README_jp.md` because changing files under `.github/README_templates` will trigger Github Actions and it overrides `.github/README.md` and `.github/README_jp.md`. And, please don't delete any files under `.github/README_templates`. If you delete them, Github Actions will result in an error.

Please put images under `.github/README_images` if you want to add images in the README (ex: `![The image](../README_images/image.jpg)`). Images outside `.github/README_images` won't be processed by Github Actions (Image urls may be invalid when generating READMEs).

There are some template phrases which are automatically inserted by Github Actions. Please see [this](https://github.com/Gakuto1112/FiguraAvatarsReadmeTemplate) for more information.

## アバターを新規作成した後にやること
1. このレポジトリの変数に`TARGET_BRANCHES`という名前でREADMEを生成する対象のブランチの配列を定義する（例：`["Senko", "Shiro", "Suzu"]`）。
2. レポジトリ"FiguraAvatarsReadmeTemplate"の変数`TARGET_REPOSITORIES`に新規アバターのレポジトリを追加する（Gakuto1112のみ）。

## アバターのブランチを増やした後にやること
1. `.github/workflows/generate_readme.yaml`の`on`->`push`->`branches`に増やしたアバターのブランチを追加する。
2. このレポジトリの変数`TARGET_BRANCHES`に増やしたアバターのブランチを追加する。