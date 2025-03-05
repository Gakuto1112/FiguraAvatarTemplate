---@class (exact) VanillaModel : AvatarModule バニラーのモデルの管理クラス
-- ---@field package honyarara ModelPart ほにゃらら
-- ---@field package marumaru Vector3 まるまる
-- ---@field package addValues fun(self: VanillaModel, a: number, b: number): number 入力された2つの値を足し、その合計を返す
-- ---@field public printHello fun(self: AvatarModule) チャット欄に「Hello player!」と表示する

VanillaModel = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return VanillaModel
    new = function (parent)
        ---@type VanillaModel
        local instance = Avatar.instantiate(VanillaModel, AvatarModule, parent) --"AvatarModule"を親クラスとし、"VanillaModel"のインスタンスを生成する。

        -- **** 子モジュール固有のメンバ変数があればここに書く。 ****

        -- 親のメンバ変数の上書きが可能（親や他モジュールには影響を与えない）
        -- instance.hoge = 100
        -- instace.fuga = "Yoshi!"

        -- 定義例
        -- instance.honyarara = models.models.main.Avatar.Head
        -- instance.marumaru = vector.vec3(1, 2, 3)

        return instance
    end;

    ---初期化関数
    ---@param self AvatarModule
    init = function (self)
        AvatarModule.init(self) --親クラスで定義した初期化処理を実行する。これを消せば親クラスの初期化処理をスキップできる。

        -- バニラのプレイヤーモデルと防具モデルを非表示にする。
        for _, vanillaModel in ipairs({vanilla_model.PLAYER, vanilla_model.ARMOR}) do
            vanillaModel:setVisible(false)
        end
    end;

    -- 子クラスのメソッドの定義例
    -- ---入力された2つの値を足し、その合計を返す。
    -- ---@param self VanillaModel
    -- ---@param a number 足し合わせる値1つめ
    -- ---@param b number 足し合わせる値2つめ
    -- ---@return number addedValue 足し合わされた値
    -- addValues = function (self, a, b)
    --     return a + b
    -- end;

    -- 親クラスのメソッドの上書きも可能（親や他モジュールには影響を与えない）
    -- ---チャット欄に「Hello player!」と表示する。
    -- ---@param self AvatarModule
    -- printHello = function (self)
    --     print("Hello player!")
    -- end;
}