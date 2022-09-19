#### 概要

Prettierの環境構築メモ。

VSCodeのプラグインとしてPrettierをインストールした場合デフォルトでは対応できない言語が存在する。解決するためにNode経由でPrettierをインストールし各言語用のPrettierプラグインを追加する。別途VSCode保存時に任意のコマンドを実行するためのプラグイン(runonsave)をインストールし特定の拡張子の場合のみprettierコマンドを明示的に呼び出すようにする。

##### 構築手順

```
# prettierをグローバルインストールする
npm install -g prettier

# sh用のPrettierプラグインを追加
npm install -g prettier-plugin-sh
```

##### Prettier用設定ファイルの作成

任意の場所(プロジェクトルートかホームディレクトリ下)に`.prettierrc`ファイルを作成する。さらにVSCode用の設定ファイルを作成し保存時にPrettierが実行されていること、配置した`.prettierrc`の内容が反映されていることを確認すること。
