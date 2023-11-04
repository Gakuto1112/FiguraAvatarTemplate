# FiguraAvatarTemplate
[Minecraft](https://www.minecraft.net/ja-jp)のスキンMod「[Figura](https://modrinth.com/mod/figura)」のアバターのテンプレートレポジトリです。

## レポジトリ構成
### avatar.json
アバターのメタファイルです。これがないとFiguraにアバターとして認識されません（逆にこれさえあればアバターとして認識されます）。ファイル内の構造については[こちら](https://wiki.figuramc.org/tutorials/Avatar%20Metadata)をご覧下さい。

### avatar.png
アバターのサムネイル画像です。アバターリストに表示されます。

### models
アバターのモデルファイルが格納されるディレクトリです。モデルは[Blockbench](https://www.blockbench.net/)で作成します。

### textures
アバターのモデルのテクスチャファイルが格納されるディレクトリです。

### scripts
アバターのスクリプトファイルが格納されるディレクトリです。言語はLuaです。Figuraが提供するLua APIについては[こちら](https://applejuiceyy.github.io/figs/)をご覧下さい。

### .github
READMEファイルや[Github Actions](https://github.co.jp/features/actions)のワークフローファイル等が格納されるディレクトリです。アバターには関係のないディレクトリです。

### .gitignore
アバターのディレクトリを[Git](https://git-scm.com/)管理する上で管理対象外にするファイル/ディレクトリの一覧です。アバターには関係のないファイルです。