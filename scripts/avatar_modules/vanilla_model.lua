---@class (exact) VanillaModel : AvatarModule バニラーのモデルの管理クラス

VanillaModel = {
    ---コンストラクタ
    ---@param parent Avatar アバターのメインクラスへの参照
    ---@return VanillaModel
    new = function (parent)
        ---@type VanillaModel
        local instance = Avatar.instantiate(VanillaModel, AvatarModule, parent)

        return instance
    end;

    ---初期化関数
    ---@param self AvatarModule
    init = function (self)
        AvatarModule.init(self)

        for _, vanillaModel in ipairs({vanilla_model.PLAYER, vanilla_model.ARMOR}) do
            vanillaModel:setVisible(false)
        end
    end;
}