.class public Lcom/htc/preference/HtcPreferenceFrameLayout$LayoutParams;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "HtcPreferenceFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/htc/preference/HtcPreferenceFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public removeBorders:Z


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    .line 162
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 135
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/htc/preference/HtcPreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 163
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "c"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x0

    .line 144
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 135
    iput-boolean v2, p0, Lcom/htc/preference/HtcPreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 146
    sget-object v1, Lcom/android/internal/R$styleable;->PreferenceFrameLayout_Layout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 148
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/htc/preference/HtcPreferenceFrameLayout$LayoutParams;->removeBorders:Z

    .line 151
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 152
    return-void
.end method
