# Part 1: Sort the list of movies 
On the list of all movies page, make the column headings for "Movie Title" and "Release Date" into clickable links. Clicking one of them should cause the list to be reloaded but sorted in ascending order on that column. For example, clicking the "release date" column heading should redisplay the list of movies with the earliest-released movies first; clicking the "title" header should list the movies alphabetically by title. (For movies whose names begin with non-letters, the sort order should match the behavior ofString#<=>.)

在电影页面，给Movie Title和Realease Date添加可点击链接。点击这两个的任意一个，能够使得页面重新加载，按照递增的顺序排列。比如，点击Release Date列标题应该把最早发行的电影排在第一；点击title应该按照阿拉伯字符顺序排序。

When the listing page is redisplayed with sorting-on-a-column enabled, the column header that was selected for sorting should appear with a yellow background, as shown below. You should do this by setting controller variables that are used to conditionally set the CSS class of the appropriate table heading to hilite, and pasting this simple CSS into RottenPotatoesapp/assets/stylesheets/default.css file:

当选中一个标题头时，需要将它的背景设为黄色。可以通过设置用来给表头设定CSS类的控制器变量来实现。

```
css table#movies th.hilite {
  background-color: yellow;
}
```

# Part 2: Filter the list of movies by rating 
Enhance RottenPotatoes as follows. At the top of the All Movies listing, add some checkboxes that allow the user to filter the list to show only movies with certain MPAA ratings:

在所有电影的顶部，增加一个选择栏，允许用户来通过特定的MPAA评级来筛选电影。