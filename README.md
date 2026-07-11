# XeLaTeX 中文教材模板

这是一个面向中文教材、讲义和学术书籍的 XeLaTeX 模板。模板强调简约、稳定、适合印刷，默认 B5 开本，也支持 A4。

## 文件结构

- `main.tex`：主文档入口，填写书名、作者、出版社信息，并组织章节。
- `cntextbook.cls`：模板类文件，包含页面尺寸、字体、页眉页脚、封面、标题、图表、公式、定理环境等设置。
- `chapters/chapter01.tex`、`chapters/chapter02.tex`：示例章节。
- `figures/`：可放置图片素材。

## 编译方式

使用 XeLaTeX 编译：

```bash
xelatex main.tex
xelatex main.tex
```

如果使用交叉引用、目录或参考文献，通常需要编译两次或更多次。

## 切换开本

在 `main.tex` 第一行切换：

```tex
\documentclass[b5]{cntextbook}
```

或：

```tex
\documentclass[a4]{cntextbook}
```

## 预置环境

模板提供以下中文编号环境：

- `definition`：定义
- `theorem`：定理
- `lemma`：引理
- `proposition`：命题
- `corollary`：推论
- `example`：例
- `remark`：注
- `exercise`：习题

公式、图片和表格均按章编号，例如 `1-1`、`2-3`。

## 说明

封面使用 TikZ 绘制，不依赖外部图片。整体色彩以黑、灰、米白为主，并使用少量朱砂色作出版物识别点缀。实际出版前，请按目标出版社要求补充版权页、CIP 数据、责任编辑、印张、字数、定价、版次、印次等信息。

## Project Status

This repository is maintained as part of SuiYueMengHen's open-source project collection. Issues and suggestions are welcome.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
