--[[

    このモジュールは、他のアバターモジュールの親となるクラスです。
    ここに定義したメンバ変数やメソッドは、子クラスであれば明示的に定義しなくても使えます。
    逆に子クラス内で明示的に定義すると、このクラスで定義したものを受け継がず、子クラス独自の挙動を作成することできます。

]]

---@class AvatarModule アバターの動作を構成するモジュールの抽象クラス
-- ---@field public parent Avatar アバターのメインクラスへの参照
-- ---@field public hoge integer ほげ --アクセス修飾子を"public"にすると他のモジュールからも参照可能となる。
---@field package fuga string --アクセス修飾子を"package"にするとこのファイル内からしか参照できなくなる。（厳密には、これを使用しても他のモジュールから参照可能ではあるが、補完候補に現れなくなり、参照すると警告が表示されるようになる。）
---@field public new fun(parent: Avatar): AvatarModule コンストラクタ
---@field public init fun(self: AvatarModule) 初期化関数
-- ---@field public printHello fun(self: AvatarModule) チャット欄に「Hello world!」と表示する --メソッドをメンバ変数としてアノテーションを書く。

AvatarModule = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return AvatarModule
    new = function (parent)
        ---@type AvatarModule
        local instance = Avatar.instantiate(AvatarModule)

        instance.parent = parent

        -- **** モジュール共通のメンバ変数があればここに書く。 ****

        -- 定義例
        -- instance.hoge = 1
        -- instance.fuga = "piyo"

        return instance
    end;

    ---初期化関数
    ---@param self AvatarModule
    init = function (self)
        -- **** モジュール共通の初期化処理があればここに書く。 ****

        -- 記述例
        -- doSomething()
    end;

    -- メソッドの定義例
    -- ---チャット欄に「Hello world!」と表示する。
    -- ---@param self AvatarModule
    -- printHello = function (self)
    --     print("Hello world!")
    -- end;
}