言語: 　[English](./README.md)　|　**日本語**

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
ここに入っているpng画像は[Github Actions](https://github.co.jp/features/actions)によって圧縮され、50%～75%のファイルサイズの削減を行います。
圧縮が不要な場合は、`.github/workflows/compress_textures.yml`を削除してください。

### scripts
アバターのスクリプトファイルが格納されるディレクトリです。言語はLuaです。Figuraが提供するLua APIについては[こちら](https://applejuiceyy.github.io/figs/)をご覧下さい。また、サンプルスクリプトの解説はスクリプトファイル内に記述されています。

### .github
READMEファイルやGithub Actionsのワークフローファイル等が格納されるディレクトリです。アバターには関係のないディレクトリです。

### .gitignore
アバターのディレクトリを[Git](https://git-scm.com/)管理する上で管理対象外にするファイル/ディレクトリの一覧です。アバターには関係のないファイルです。

## READMEの編集について
READMEはGithub Actionsによって、`.github/README_templates`から`.github/README.md`と`.github/README_jp.md`が生成されます。`.github/README_templates`配下のファイルが変更されるとGithub Actionsが動作する為、READMEを編集する場合は、`.github/README_templates`配下のファイルを編集して下さい。`.github/README.md`や`.github/README_jp.md`は編集しないで下さい。Github Actionsによって上書きされます。また、`.github/README_templates`配下のファイルは削除しないで下さい。Github Actionsのワークフローでエラーが発生します。

README内で画像を挿入する場合は、画像を`.github/README_images`配下に置いて下さい（例：`![画像](./README_images/image.jpg)`）。これ以外の画像は、Github Actionsによって処理されません（README生成時にリンクが切れる場合があります）。

READMEにはGithub Actionsによって自動的に挿入されるテンプレート文があります。詳しくは[こちら](https://github.com/Gakuto1112/FiguraAvatarsReadmeTemplate)をご覧下さい。

## アバターを新規作成した後にやること
1. このレポジトリの変数に`TARGET_BRANCHES`という名前でREADMEを生成する対象のブランチの配列を定義する（例：`["Senko", "Shiro", "Suzu"]`）。
2. レポジトリ"FiguraAvatarsReadmeTemplate"の変数`TARGET_REPOSITORIES`に新規アバターのレポジトリを追加する（Gakuto1112のみ）。

## アバターのブランチを増やした後にやること
1. `.github/workflows/generate_readme.yml`の`on`->`push`->`branches`に増やしたアバターのブランチを追加する。
   - ワイルドカードによるブランチの指定が可能であれば、そちらの方が後々楽です。
2. このレポジトリの変数`TARGET_BRANCHES`に増やしたアバターのブランチを追加する。
