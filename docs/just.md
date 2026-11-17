# just

## 杂项

```bash
# 查看版本
just --version

# 查看可用命令列表
just --list
```

## 设置shell

```just
set windows-shell := ["pwsh", "-c"]
```

指定Windows平台上使用的shell，对其他平台无影响。

## 别名

```just
# 为配方设置别名
alias b := build

# 配方
build:
    zensical build
```

## 变量

```just
tmpdir  := `mktemp -d`
version := "0.2.7"
tardir  := tmpdir / "awesomesauce-" + version
tarball := tardir + ".tar.gz"

publish:
  rm -f {{tarball}}
  mkdir {{tardir}}
  cp README.md *.c {{tardir}}
  tar zcvf {{tarball}} {{tardir}}
  scp {{tarball}} me@server.com:release/
  rm -rf {{tarball}} {{tardir}}
```

使用`:=`语法创建变量，在配方中使用双花括号`{{...}}`引用变量。

## 配方参数

```just
build target:
  @echo 'Building {{target}}…'
  cd {{target}} && make
```

配方参数直接放在配方名后面，在配方内部和变量一样通过双花括号`{{...}}`引用。

```just
default := 'all'

test target tests=default:
  @echo 'Testing {{target}}:{{tests}}…'
  ./test --tests {{tests}} {{target}}
```

配方参数可以使用`=`赋默认值。
