---@class Avatar アバターのメインクラス
---@field public vanillaModel VanillaModel バニラーのプレイヤーモデルを管理するインスタンス
---@field public instantiate fun(class: table, super: table, ...: any) クラスをインスタンス化する

Avatar = {
	---コンストラクタ
	---@return Avatar
	new = function ()
		---@type Avatar
		local instance = Avatar.instantiate(Avatar)

		--ENTITY_INIT前に読み込み
		require("scripts.avatar_modules.avatar_module")

		--生徒固有クラスの読み込み

		events.ENTITY_INIT:register(function ()
			--アバターモジュールの読み込み
            require("scripts.avatar_modules.vanilla_model")
            instance.vanillaModel = VanillaModel.new(instance)
            instance.vanillaModel:init()
		end)

		return instance
	end;

    ---クラスをインスタンス化する。
	---@generic S
	---@generic C
	---@param class `C` インスタンス化するクラス
	---@param super? `S` インスタンス化するクラスのスーパークラス
	---@param ... any クラスのインスタンス時に渡される引数
	---@return C instance インスタンス化されたクラスのオブジェクト
    instantiate = function (class, super, ...)
        ---@diagnostic disable-next-line: undefined-field
        local instance = super and super.new(...) or {}
        setmetatable(instance, {__index = class})
        setmetatable(class, {__index = super})
		return instance
    end;
}

AvatarInstance = Avatar.new()