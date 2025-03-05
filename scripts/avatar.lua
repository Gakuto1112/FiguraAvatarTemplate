--[[

    このアバターのスクリプトは、この"avatar.lua"をマスタークラス兼エントリーポイントとし、そこにアバターの各機能に細分化した子クラスのインスタンスをぶら下げるという構造になっています。
    子クラスは"avatar_modules/avatar_module.lua"を継承し、統一された設計になっています。
    このような設計にすることで、スクリプト設計に統一性が生まれ、メンテナンスがしやすくなったり、他のアバターへのスクリプトの流用がしやすくなったりといったメリットが期待されます。

    このアバタースクリプトで採用している構造は、下記リンクでのアバターでも採用しています。参考にしてください。
    https://github.com/Gakuto1112/FiguraBlueArchiveCharacters

    下記で触れているアノテーションは次のリンクを参考にしてください。
    https://luals.github.io/wiki/annotations/

    Figuraで使用できるAPIについては次のリンクを参照してください。
    https://applejuiceyy.github.io/figs/
]]

---@class Avatar アバターのメインクラス
-- ---@field public modulesBeforePlayerInit ModulesBeforePlayerInit プレイヤーエンティティの読み込みを待たずに呼び出すインスタンス --アノテーションを書いておけばコーディングが楽になる。
-- ---@field public modulesAfterPlayerInit ModulesAfterPlayerInit プレイヤーエンティティの読み込みを待ってから呼び出すインスタンス --アノテーションを書いておけばコーディングが楽になる。
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

        -- **** ここにプレイヤーエンティティの読み込みを待たずに呼び出すモジュールを定義する。 ****

        -- モジュールの呼び出し例
        -- require("scripts.avatar_modules.modules_before_player_init") --スクリプトを読み込む。この時点でメモリ上に静的クラスが展開される。
        -- instance.modulesBeforePlayerInit = ModulesBeforePlayerInit.new(instance) --読み込んだクラスをインスタンス化する。クラスのインスタンス化時にはマスタークラスへの参照を渡し、後で子クラス同士が相互参照できるようにしている。
        -- instance.modulesBeforePlayerInit:init() --インスタンスを初期化処理する。


		events.ENTITY_INIT:register(function ()
			--アバターモジュールの読み込み

            -- **** ここにプレイヤーエンティティの読み込みを待ってから呼び出すモジュールを定義する。 ****

            -- モジュールの呼び出し例
            -- require("scripts.avatar_modules.modules_after_player_init")
            -- instance.modulesAfterPlayerInit = ModulesAfterPlayerInit.new(instance)
            -- instance.modulesAfterPlayerInit:init()

            -- バニラのプレイヤーモデルと防具モデルを非表示にするモジュール
            -- 不要であれば削除しても構わない。
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