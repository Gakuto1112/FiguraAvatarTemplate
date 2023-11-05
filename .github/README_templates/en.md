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

## READMEの編集について
READMEは[Github Actions](https://github.co.jp/features/actions)によって、`.github/README_templates`から`.github/README.md`と`.github/README_jp.md`が生成されます。`.github/README_templates`配下のファイルが変更されるとGithub Actionsが動作する為、READMEを編集する場合は、`.github/README_templates`配下のファイルを編集して下さい。`.github/README.md`や`.github/README_jp.md`は編集しないで下さい。Github Actionsによって上書きされます。また、`.github/README_templates`配下のファイルは削除しないで下さい。Github Actionsのワークフローでエラーが発生します。

README内で画像を挿入する場合は、画像を`.github/README_images`配下に置いて下さい（例：`![画像](../README_images/image.jpg)`）。これ以外の画像は、Github Actionsによって処理されません（README生成時にリンクが切れる場合があります）。

READMEにはGithub Actionsによって自動的に挿入されるテンプレート文があります。詳しくは[こちら](https://github.com/Gakuto1112/FiguraAvatarsReadmeTemplate)をご覧下さい。

## アバターを新規作成した後にやること
1. このレポジトリの変数に`TARGET_BRANCHES`という名前でREADMEを生成する対象のブランチの配列を定義する（例：`["Senko", "Shiro", "Suzu"]`）。
2. レポジトリ"FiguraAvatarsReadmeTemplate"の変数`TARGET_REPOSITORIES`に新規アバターのレポジトリを追加する（Gakuto1112のみ）。

## アバターのブランチを増やした後にやること
1. `.github/workflows/generate_readme.yaml`の`on`->`push`->`branches`に増やしたアバターのブランチを追加する。
2. このレポジトリの変数`TARGET_BRANCHES`に増やしたアバターのブランチを追加する。