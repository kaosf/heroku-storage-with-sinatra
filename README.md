git が使えるようにしておく

```ShellScript
sudo aptitude install git-core # Ubuntu の場合　他は知らん(
```

Ruby 環境は必須

Bundler と heroku コマンドを使えるようにしておく

```ShellScript
gem install bundler
gem install heroku
```

第一引数にアプリ名，第二引数にコミットコメントを指定 (省略すると init)

```ShellScript
ruby a.rb APPNAME [COMMIT-COMMENT]
```

あとは appname ディレクトリに入って deploy するだけ

```ShellScript
cd APPNAME
git push heroku master
```

もっとちゃんと作らんとね… gem にしちゃいたい
