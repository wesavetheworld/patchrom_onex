.class Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;
.super Landroid/widget/ListView;
.source "ListPopupBubbleWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/htc/widget/internal/ListPopupBubbleWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DropDownListView"
.end annotation


# static fields
.field static final NO_POSITION:I = -0x1

.field private static final TAG:Ljava/lang/String; = "ListPopupBubbleWindow.DropDownListView"


# instance fields
.field private mHijackFocus:Z

.field private mListSelectionHidden:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 3
    .parameter "context"
    .parameter "hijackFocus"

    .prologue
    const/4 v2, 0x1

    .line 1417
    const/4 v0, 0x0

    const v1, 0x201007e

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 1418
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x2080041

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 1419
    invoke-virtual {p0, v2}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->setDarkModeEnabled(Z)V

    .line 1420
    iput-boolean p2, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mHijackFocus:Z

    .line 1421
    const/4 v0, 0x4

    invoke-virtual {p0, v0, v2}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->enableAnimation(IZ)V

    .line 1423
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->setCacheColorHint(I)V

    .line 1424
    return-void
.end method

.method static synthetic access$502(Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1372
    iput-boolean p1, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mListSelectionHidden:Z

    return p1
.end method

.method private mockMeasureScrapChild(Landroid/view/View;II)V
    .locals 10
    .parameter "child"
    .parameter "position"
    .parameter "widthMeasureSpec"

    .prologue
    const/4 v9, 0x0

    .line 1547
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/AbsListView$LayoutParams;

    .line 1548
    .local v6, p:Landroid/widget/AbsListView$LayoutParams;
    if-nez v6, :cond_0

    .line 1549
    new-instance v6, Landroid/widget/AbsListView$LayoutParams;

    .end local v6           #p:Landroid/widget/AbsListView$LayoutParams;
    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/AbsListView$LayoutParams;-><init>(III)V

    .line 1551
    .restart local v6       #p:Landroid/widget/AbsListView$LayoutParams;
    invoke-virtual {p1, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1553
    :cond_0
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 1557
    .local v0, adapter:Landroid/widget/ListAdapter;
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getListPaddingLeft()I

    move-result v3

    .line 1558
    .local v3, listPaddingLeft:I
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getListPaddingRight()I

    move-result v4

    .line 1561
    .local v4, listPaddingRight:I
    add-int v7, v3, v4

    iget v8, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {p3, v7, v8}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v2

    .line 1563
    .local v2, childWidthSpec:I
    iget v5, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1565
    .local v5, lpHeight:I
    if-lez v5, :cond_1

    .line 1566
    const/high16 v7, 0x4000

    invoke-static {v5, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1570
    .local v1, childHeightSpec:I
    :goto_0
    invoke-virtual {p1, v2, v1}, Landroid/view/View;->measure(II)V

    .line 1571
    return-void

    .line 1568
    .end local v1           #childHeightSpec:I
    :cond_1
    invoke-static {v9, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .restart local v1       #childHeightSpec:I
    goto :goto_0
.end method


# virtual methods
.method public hasFocus()Z
    .locals 1

    .prologue
    .line 1477
    iget-boolean v0, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Landroid/widget/ListView;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasWindowFocus()Z
    .locals 1

    .prologue
    .line 1457
    iget-boolean v0, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Landroid/widget/ListView;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFocused()Z
    .locals 1

    .prologue
    .line 1467
    iget-boolean v0, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Landroid/widget/ListView;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInTouchMode()Z
    .locals 1

    .prologue
    .line 1447
    iget-boolean v0, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mHijackFocus:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mListSelectionHidden:Z

    if-nez v0, :cond_1

    :cond_0
    invoke-super {p0}, Landroid/widget/ListView;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method mockLookForSelectablePosition(IZ)I
    .locals 4
    .parameter "position"
    .parameter "lookDown"

    .prologue
    const/4 v2, -0x1

    .line 1574
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 1575
    .local v0, adapter:Landroid/widget/ListAdapter;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->isInTouchMode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1601
    :cond_0
    :goto_0
    return v2

    .line 1579
    :cond_1
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    .line 1580
    .local v1, count:I
    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v3

    if-nez v3, :cond_4

    .line 1581
    if-eqz p2, :cond_2

    .line 1582
    const/4 v3, 0x0

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1583
    :goto_1
    if-ge p1, v1, :cond_3

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1584
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 1587
    :cond_2
    add-int/lit8 v3, v1, -0x1

    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 1588
    :goto_2
    if-ltz p1, :cond_3

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1589
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    .line 1593
    :cond_3
    if-ltz p1, :cond_0

    if-ge p1, v1, :cond_0

    move v2, p1

    .line 1596
    goto :goto_0

    .line 1598
    :cond_4
    if-ltz p1, :cond_0

    if-ge p1, v1, :cond_0

    move v2, p1

    .line 1601
    goto :goto_0
.end method

.method final mockMeasureHeightOfChildren(IIIII)I
    .locals 14
    .parameter "widthMeasureSpec"
    .parameter "startPosition"
    .parameter "endPosition"
    .parameter "maxHeight"
    .parameter "disallowPartialChildPosition"

    .prologue
    .line 1484
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    .line 1485
    .local v1, adapter:Landroid/widget/ListAdapter;
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getListPaddingTop()I

    move-result v8

    .line 1486
    .local v8, listPaddingTop:I
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getListPaddingBottom()I

    move-result v7

    .line 1488
    .local v7, listPaddingBottom:I
    if-nez v1, :cond_1

    .line 1489
    add-int v9, v8, v7

    .line 1543
    :cond_0
    :goto_0
    return v9

    .line 1493
    :cond_1
    add-int v12, v8, v7

    .line 1494
    .local v12, returnedHeight:I
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1495
    .local v3, divider:Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->getDividerHeight()I

    move-result v10

    .line 1496
    .local v10, realDividerHeight:I
    if-lez v10, :cond_6

    if-eqz v3, :cond_6

    move v4, v10

    .line 1499
    .local v4, dividerHeight:I
    :goto_1
    const/4 v9, 0x0

    .line 1505
    .local v9, prevHeightWithoutPartialChild:I
    const/4 v13, -0x1

    move/from16 v0, p3

    if-ne v0, v13, :cond_2

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v13

    add-int/lit8 p3, v13, -0x1

    .line 1506
    :cond_2
    invoke-virtual {p0}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->recycleOnMeasure()Z

    move-result v11

    .line 1508
    .local v11, recyle:Z
    const/4 v5, 0x0

    .line 1510
    .local v5, firstChildHeight:I
    move/from16 v6, p2

    .local v6, i:I
    :goto_2
    move/from16 v0, p3

    if-gt v6, v0, :cond_9

    .line 1511
    move/from16 v0, p2

    if-ne v6, v0, :cond_3

    .line 1513
    const/4 v13, 0x0

    invoke-interface {v1, v6, v13, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 1514
    .local v2, child:Landroid/view/View;
    invoke-direct {p0, v2, v6, p1}, Lcom/htc/widget/internal/ListPopupBubbleWindow$DropDownListView;->mockMeasureScrapChild(Landroid/view/View;II)V

    .line 1515
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 1518
    .end local v2           #child:Landroid/view/View;
    :cond_3
    if-lez v6, :cond_4

    .line 1520
    add-int/2addr v12, v4

    .line 1523
    :cond_4
    add-int/2addr v12, v5

    .line 1525
    move/from16 v0, p4

    if-lt v12, v0, :cond_7

    .line 1528
    if-ltz p5, :cond_5

    move/from16 v0, p5

    if-le v6, v0, :cond_5

    if-lez v9, :cond_5

    move/from16 v0, p4

    if-ne v12, v0, :cond_0

    :cond_5
    move/from16 v9, p4

    goto :goto_0

    .line 1496
    .end local v4           #dividerHeight:I
    .end local v5           #firstChildHeight:I
    .end local v6           #i:I
    .end local v9           #prevHeightWithoutPartialChild:I
    .end local v11           #recyle:Z
    :cond_6
    const/4 v4, 0x0

    goto :goto_1

    .line 1536
    .restart local v4       #dividerHeight:I
    .restart local v5       #firstChildHeight:I
    .restart local v6       #i:I
    .restart local v9       #prevHeightWithoutPartialChild:I
    .restart local v11       #recyle:Z
    :cond_7
    if-ltz p5, :cond_8

    move/from16 v0, p5

    if-lt v6, v0, :cond_8

    .line 1537
    move v9, v12

    .line 1510
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_9
    move v9, v12

    .line 1543
    goto :goto_0
.end method
