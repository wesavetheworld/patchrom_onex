.class public final Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;
.super Lcom/android/internal/telephony/SMSDispatcher;
.source "GsmSMSDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    }
.end annotation


# static fields
.field private static final DCS_216:I = 0xd8

.field private static final EVENT_NEW_BROADCAST_SMS:I = 0x65

.field private static final PID_65:I = 0x41

.field private static final TAG:Ljava/lang/String; = "GSM"


# instance fields
.field private mGsmPhone:Lcom/android/internal/telephony/PhoneBase;

.field private final mSmsCbPageMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;",
            "[[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;)V
    .locals 3
    .parameter "phone"
    .parameter "storageMonitor"
    .parameter "usageMonitor"

    .prologue
    const/4 v2, 0x0

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/SMSDispatcher;-><init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;)V

    .line 1202
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    .line 104
    check-cast p1, Lcom/android/internal/telephony/gsm/GSMPhone;

    .end local p1
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mGsmPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 105
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setOnNewGsmSms(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 107
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0x65

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setOnNewGsmBroadcastSms(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;ILcom/android/internal/telephony/WapPushOverSms;)V
    .locals 3
    .parameter "phone"
    .parameter "storageMonitor"
    .parameter "usageMonitor"
    .parameter "type"
    .parameter "wapPush"

    .prologue
    const/4 v2, 0x0

    .line 122
    invoke-direct/range {p0 .. p5}, Lcom/android/internal/telephony/SMSDispatcher;-><init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/SmsUsageMonitor;ILcom/android/internal/telephony/WapPushOverSms;)V

    .line 1202
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    .line 123
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mGsmPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 125
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setOnNewGsmSms(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 126
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0x65

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setOnNewGsmBroadcastSms(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 127
    return-void
.end method

.method private handleBroadcastSms(Landroid/os/AsyncResult;)V
    .locals 16
    .parameter "ar"

    .prologue
    .line 1211
    :try_start_0
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v14, [B

    move-object v0, v14

    check-cast v0, [B

    move-object v13, v0

    .line 1227
    .local v13, receivedPdu:[B
    new-instance v5, Lcom/android/internal/telephony/gsm/SmsCbHeader;

    invoke-direct {v5, v13}, Lcom/android/internal/telephony/gsm/SmsCbHeader;-><init>([B)V

    .line 1228
    .local v5, header:Lcom/android/internal/telephony/gsm/SmsCbHeader;
    const-string v14, "gsm.operator.numeric"

    invoke-static {v14}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1229
    .local v12, plmn:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v14}, Lcom/android/internal/telephony/Phone;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v1

    check-cast v1, Landroid/telephony/gsm/GsmCellLocation;

    .line 1230
    .local v1, cellLocation:Landroid/telephony/gsm/GsmCellLocation;
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v10

    .line 1231
    .local v10, lac:I
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v2

    .line 1234
    .local v2, cid:I
    iget v14, v5, Lcom/android/internal/telephony/gsm/SmsCbHeader;->nrOfPages:I

    const/4 v15, 0x1

    if-le v14, v15, :cond_5

    .line 1236
    new-instance v3, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;

    invoke-direct {v3, v5, v12, v10, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;-><init>(Lcom/android/internal/telephony/gsm/SmsCbHeader;Ljava/lang/String;II)V

    .line 1239
    .local v3, concatInfo:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    invoke-virtual {v14, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[B

    .line 1241
    .local v11, pdus:[[B
    if-nez v11, :cond_0

    .line 1244
    iget v14, v5, Lcom/android/internal/telephony/gsm/SmsCbHeader;->nrOfPages:I

    new-array v11, v14, [[B

    .line 1246
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    invoke-virtual {v14, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1250
    :cond_0
    iget v14, v5, Lcom/android/internal/telephony/gsm/SmsCbHeader;->pageIndex:I

    add-int/lit8 v14, v14, -0x1

    aput-object v13, v11, v14

    .line 1252
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    array-length v14, v11

    if-ge v6, v14, :cond_3

    .line 1253
    aget-object v14, v11, v6

    if-nez v14, :cond_2

    .line 1285
    .end local v1           #cellLocation:Landroid/telephony/gsm/GsmCellLocation;
    .end local v2           #cid:I
    .end local v3           #concatInfo:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    .end local v5           #header:Lcom/android/internal/telephony/gsm/SmsCbHeader;
    .end local v6           #i:I
    .end local v10           #lac:I
    .end local v11           #pdus:[[B
    .end local v12           #plmn:Ljava/lang/String;
    .end local v13           #receivedPdu:[B
    :cond_1
    :goto_1
    return-void

    .line 1252
    .restart local v1       #cellLocation:Landroid/telephony/gsm/GsmCellLocation;
    .restart local v2       #cid:I
    .restart local v3       #concatInfo:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    .restart local v5       #header:Lcom/android/internal/telephony/gsm/SmsCbHeader;
    .restart local v6       #i:I
    .restart local v10       #lac:I
    .restart local v11       #pdus:[[B
    .restart local v12       #plmn:Ljava/lang/String;
    .restart local v13       #receivedPdu:[B
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1260
    :cond_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    invoke-virtual {v14, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1267
    .end local v3           #concatInfo:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    .end local v6           #i:I
    :goto_2
    iget v14, v5, Lcom/android/internal/telephony/gsm/SmsCbHeader;->messageIdentifier:I

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsCbHeader;->isEmergencyMessage(I)Z

    move-result v8

    .line 1268
    .local v8, isEmergencyMessage:Z
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v8}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->dispatchBroadcastPdus([[BZ)V

    .line 1273
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mSmsCbPageMap:Ljava/util/HashMap;

    invoke-virtual {v14}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 1275
    .local v9, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;>;"
    :cond_4
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 1276
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;

    .line 1278
    .local v7, info:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    invoke-virtual {v7, v12, v10, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;->matchesLocation(Ljava/lang/String;II)Z

    move-result v14

    if-nez v14, :cond_4

    .line 1279
    invoke-interface {v9}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 1282
    .end local v1           #cellLocation:Landroid/telephony/gsm/GsmCellLocation;
    .end local v2           #cid:I
    .end local v5           #header:Lcom/android/internal/telephony/gsm/SmsCbHeader;
    .end local v7           #info:Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;
    .end local v8           #isEmergencyMessage:Z
    .end local v9           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/telephony/gsm/GsmSMSDispatcher$SmsCbConcatInfo;>;"
    .end local v10           #lac:I
    .end local v11           #pdus:[[B
    .end local v12           #plmn:Ljava/lang/String;
    .end local v13           #receivedPdu:[B
    :catch_0
    move-exception v4

    .line 1283
    .local v4, e:Ljava/lang/RuntimeException;
    const-string v14, "GSM"

    const-string v15, "Error in decoding SMS CB pdu"

    invoke-static {v14, v15, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1263
    .end local v4           #e:Ljava/lang/RuntimeException;
    .restart local v1       #cellLocation:Landroid/telephony/gsm/GsmCellLocation;
    .restart local v2       #cid:I
    .restart local v5       #header:Lcom/android/internal/telephony/gsm/SmsCbHeader;
    .restart local v10       #lac:I
    .restart local v12       #plmn:Ljava/lang/String;
    .restart local v13       #receivedPdu:[B
    :cond_5
    const/4 v14, 0x1

    :try_start_1
    new-array v11, v14, [[B

    .line 1264
    .restart local v11       #pdus:[[B
    const/4 v14, 0x0

    aput-object v13, v11, v14
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private static resultToCause(I)I
    .locals 1
    .parameter "rc"

    .prologue
    .line 1112
    packed-switch p0, :pswitch_data_0

    .line 1121
    :pswitch_0
    const/16 v0, 0xff

    :goto_0
    return v0

    .line 1116
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1118
    :pswitch_2
    const/16 v0, 0xd3

    goto :goto_0

    .line 1112
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private sendDataVZWLTE(Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 10
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "destPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 416
    if-eqz p6, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {p2, p1, p3, p4, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;I[BZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v9

    .line 420
    .local v9, pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 421
    .local v7, bundle:Landroid/os/Bundle;
    const-string v0, "DEST_ADDRESS"

    invoke-virtual {v7, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    if-eqz v9, :cond_1

    .line 425
    iget-object v1, v9, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    iget-object v2, v9, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, p5

    move-object/from16 v4, p6

    move-object v8, p1

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 430
    :goto_1
    return-void

    .line 416
    .end local v7           #bundle:Landroid/os/Bundle;
    .end local v9           #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 428
    .restart local v7       #bundle:Landroid/os/Bundle;
    .restart local v9       #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const-string v0, "GSM"

    const-string v1, "GsmSMSDispatcher.sendDataVZWLTE(): getSubmitPdu() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private sendMultipartTextWithPermit(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 7
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 771
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v6, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendMultipartTextWithPermit(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 772
    return-void
.end method

.method private sendMultipartTextWithPermit(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    .locals 25
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "nli"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 803
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/16 v23, 0x1

    .line 804
    .local v23, ss:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 805
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getState()I

    move-result v23

    .line 811
    :goto_0
    if-eqz v23, :cond_2

    .line 812
    const/4 v14, 0x0

    .local v14, i:I
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .local v10, count:I
    :goto_1
    if-ge v14, v10, :cond_d

    .line 813
    const/16 v20, 0x0

    .line 814
    .local v20, sentIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_0

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v14, :cond_0

    .line 815
    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20           #sentIntent:Landroid/app/PendingIntent;
    check-cast v20, Landroid/app/PendingIntent;

    .line 817
    .restart local v20       #sentIntent:Landroid/app/PendingIntent;
    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1, v3}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v24

    .line 818
    .local v24, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-static/range {v23 .. v24}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->handleNotInService(ILcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 812
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 808
    .end local v10           #count:I
    .end local v14           #i:I
    .end local v20           #sentIntent:Landroid/app/PendingIntent;
    .end local v24           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_1
    const-string v2, "GSM"

    const-string v3, "mPhone or gerServiceState is null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 823
    :cond_2
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->getNextConcatenatedRef()I

    move-result v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v19, v0

    .line 826
    .local v19, refNumber:I
    const/4 v8, 0x1

    .line 828
    .local v8, is7bitOnly:Z
    const/4 v14, 0x0

    .restart local v14       #i:I
    :goto_2
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v14, v2, :cond_3

    .line 829
    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x1

    move/from16 v0, p6

    invoke-static {v2, v3, v0}, Lcom/android/internal/telephony/GsmAlphabet;->countGsmSeptets(Ljava/lang/CharSequence;ZI)I

    move-result v21

    .line 830
    .local v21, septetCount:I
    const/16 v2, 0xff

    move/from16 v0, v21

    if-le v0, v2, :cond_9

    .line 831
    new-instance v2, Lcom/android/internal/telephony/EncodeException;

    const-string v3, "error"

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 834
    .end local v21           #septetCount:I
    :catch_0
    move-exception v13

    .line 836
    .local v13, e:Lcom/android/internal/telephony/EncodeException;
    const/4 v8, 0x0

    .line 840
    .end local v13           #e:Lcom/android/internal/telephony/EncodeException;
    :cond_3
    const/4 v14, 0x0

    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v17

    .local v17, msgCount:I
    :goto_3
    move/from16 v0, v17

    if-ge v14, v0, :cond_d

    .line 841
    new-instance v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct {v9}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 842
    .local v9, concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v19

    iput v0, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 843
    add-int/lit8 v2, v14, 0x1

    iput v2, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 844
    move/from16 v0, v17

    iput v0, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 845
    const/4 v2, 0x0

    iput-boolean v2, v9, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->isEightBits:Z

    .line 846
    new-instance v22, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct/range {v22 .. v22}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 847
    .local v22, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move-object/from16 v0, v22

    iput-object v9, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    .line 850
    const/4 v2, -0x1

    move/from16 v0, p6

    if-eq v0, v2, :cond_5

    .line 851
    const/4 v2, 0x1

    new-array v11, v2, [B

    .line 852
    .local v11, data:[B
    const/4 v2, 0x0

    move/from16 v0, p6

    int-to-byte v3, v0

    aput-byte v3, v11, v2

    .line 853
    new-instance v16, Lcom/android/internal/telephony/SmsHeader$MiscElt;

    invoke-direct/range {v16 .. v16}, Lcom/android/internal/telephony/SmsHeader$MiscElt;-><init>()V

    .line 855
    .local v16, miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    const/16 v2, 0xe

    move/from16 v0, p6

    if-eq v0, v2, :cond_4

    .line 856
    const/16 v2, 0x24

    move-object/from16 v0, v16

    iput v2, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->id:I

    .line 857
    move-object/from16 v0, v16

    iput-object v11, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->data:[B

    .line 858
    move-object/from16 v0, v22

    iget-object v2, v0, Lcom/android/internal/telephony/SmsHeader;->miscEltList:Ljava/util/ArrayList;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 861
    :cond_4
    const/4 v2, 0x3

    move/from16 v0, p6

    if-ne v0, v2, :cond_5

    .line 862
    const/16 v2, 0x25

    move-object/from16 v0, v16

    iput v2, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->id:I

    .line 863
    move-object/from16 v0, v16

    iput-object v11, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->data:[B

    .line 864
    move-object/from16 v0, v22

    iget-object v2, v0, Lcom/android/internal/telephony/SmsHeader;->miscEltList:Ljava/util/ArrayList;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 869
    .end local v11           #data:[B
    .end local v16           #miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    :cond_5
    const/16 v20, 0x0

    .line 870
    .restart local v20       #sentIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_6

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v14, :cond_6

    .line 871
    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20           #sentIntent:Landroid/app/PendingIntent;
    check-cast v20, Landroid/app/PendingIntent;

    .line 874
    .restart local v20       #sentIntent:Landroid/app/PendingIntent;
    :cond_6
    const/4 v12, 0x0

    .line 875
    .local v12, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p5, :cond_7

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v14, :cond_7

    .line 876
    move-object/from16 v0, p5

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v12, Landroid/app/PendingIntent;

    .line 884
    .restart local v12       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_7
    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v12, :cond_a

    const/4 v5, 0x1

    :goto_4
    invoke-static/range {v22 .. v22}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v6

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    move/from16 v7, p6

    invoke-static/range {v2 .. v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v18

    .line 888
    .local v18, pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 889
    .local v15, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "smsc"

    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    invoke-virtual {v15, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 890
    const-string v2, "pdu"

    move-object/from16 v0, v18

    iget-object v3, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    invoke-virtual {v15, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    const-string v2, "destaddr"

    move-object/from16 v0, p1

    invoke-virtual {v15, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 893
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v15, v1, v12}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->SmsTrackerFactory(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v24

    .line 901
    .restart local v24       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->VERIZON_LTE_CONFIG()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 902
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->isVoLTEEnabled()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 903
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRecipient:Ljava/lang/String;

    .line 906
    :cond_8
    if-nez v14, :cond_b

    .line 907
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendSmsExtendMore(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 840
    :goto_5
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_3

    .line 828
    .end local v9           #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v12           #deliveryIntent:Landroid/app/PendingIntent;
    .end local v15           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v17           #msgCount:I
    .end local v18           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v20           #sentIntent:Landroid/app/PendingIntent;
    .end local v22           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v24           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    .restart local v21       #septetCount:I
    :cond_9
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_2

    .line 884
    .end local v21           #septetCount:I
    .restart local v9       #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .restart local v12       #deliveryIntent:Landroid/app/PendingIntent;
    .restart local v17       #msgCount:I
    .restart local v20       #sentIntent:Landroid/app/PendingIntent;
    .restart local v22       #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_a
    const/4 v5, 0x0

    goto :goto_4

    .line 908
    .restart local v15       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v18       #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .restart local v24       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_b
    const/4 v2, 0x1

    move/from16 v0, v17

    if-le v0, v2, :cond_c

    add-int/lit8 v2, v17, -0x1

    if-ne v14, v2, :cond_c

    .line 909
    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;ZZ)V

    goto :goto_5

    .line 911
    :cond_c
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;ZZ)V

    goto :goto_5

    .line 915
    .end local v8           #is7bitOnly:Z
    .end local v9           #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v12           #deliveryIntent:Landroid/app/PendingIntent;
    .end local v15           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v17           #msgCount:I
    .end local v18           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v19           #refNumber:I
    .end local v20           #sentIntent:Landroid/app/PendingIntent;
    .end local v22           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v24           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_d
    return-void
.end method

.method private sendSmsExtendMore(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 7
    .parameter "tracker"

    .prologue
    .line 1032
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->checkInSegmentToRIL(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 1034
    iget-object v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mData:Ljava/util/HashMap;

    .line 1036
    .local v0, map:Ljava/util/HashMap;
    const-string v4, "smsc"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    move-object v3, v4

    check-cast v3, [B

    .line 1037
    .local v3, smsc:[B
    const-string v4, "pdu"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    move-object v1, v4

    check-cast v1, [B

    .line 1039
    .local v1, pdu:[B
    const/4 v4, 0x2

    invoke-virtual {p0, v4, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 1042
    .local v2, reply:Landroid/os/Message;
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->VERIZON_LTE_CONFIG()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->KDDI_LTE_CONFIG()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1044
    :cond_0
    const-string v4, "GSM"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sendSmsExtendMore(), mImsRadioTech = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget v6, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mImsRadioTech:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1045
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->isImsAvailable()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1046
    iget-object v4, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6, v2}, Lcom/android/internal/telephony/CommandsInterface;->sendImsGsmSms(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 1054
    :goto_0
    return-void

    .line 1052
    :cond_1
    iget-object v4, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6, v2}, Lcom/android/internal/telephony/CommandsInterface;->sendSMSExtendMore(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private sendTextVZWLTE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/os/Bundle;)V
    .locals 11
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "bundle"

    .prologue
    .line 461
    if-eqz p5, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {p2, p1, p3, v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v10

    .line 465
    .local v10, pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-nez p6, :cond_0

    .line 466
    new-instance p6, Landroid/os/Bundle;

    .end local p6
    invoke-direct/range {p6 .. p6}, Landroid/os/Bundle;-><init>()V

    .line 467
    .restart local p6
    :cond_0
    const-string v1, "DEST_ADDRESS"

    move-object/from16 v0, p6

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    if-eqz v10, :cond_2

    .line 471
    iget-object v2, v10, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    iget-object v3, v10, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v8, p6

    move-object v9, p1

    invoke-virtual/range {v1 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 476
    :goto_1
    return-void

    .line 461
    .end local v10           #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 474
    .restart local v10       #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_2
    const-string v1, "GSM"

    const-string v2, "GsmSMSDispatcher.sendTextVZWLTE(): getSubmitPdu() returned null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method protected acknowledgeLastIncomingSms(ZILandroid/os/Message;)V
    .locals 2
    .parameter "success"
    .parameter "result"
    .parameter "response"

    .prologue
    .line 1108
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {p2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->resultToCause(I)I

    move-result v1

    invoke-interface {v0, p1, v1, p3}, Lcom/android/internal/telephony/CommandsInterface;->acknowledgeLastIncomingGsmSms(ZILandroid/os/Message;)V

    .line 1109
    return-void
.end method

.method public calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;
    .locals 1
    .parameter "messageBody"
    .parameter "use7bitOnly"

    .prologue
    .line 1102
    invoke-static {p1, p2}, Lcom/android/internal/telephony/gsm/SmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;

    move-result-object v0

    return-object v0
.end method

.method public dispatchMessage(Lcom/android/internal/telephony/SmsMessageBase;)I
    .locals 14
    .parameter "smsb"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 266
    if-nez p1, :cond_1

    .line 267
    const-string v9, "GSM"

    const-string v10, "dispatchMessage: message is null"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    const/4 v10, 0x2

    .line 384
    :cond_0
    :goto_0
    return v10

    .line 271
    :cond_1
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v9}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v9

    invoke-virtual {p1, v9}, Lcom/android/internal/telephony/SmsMessageBase;->setsinglesmsPhoneType(I)V

    move-object v6, p1

    .line 272
    check-cast v6, Lcom/android/internal/telephony/gsm/SmsMessage;

    .line 274
    .local v6, sms:Lcom/android/internal/telephony/gsm/SmsMessage;
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isTypeZero()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 277
    const-string v9, "GSM"

    const-string v11, "Received short message type 0, Don\'t display or store it. Send Ack"

    invoke-static {v9, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 281
    :cond_2
    iget-boolean v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mSmsReceiveDisabled:Z

    if-eqz v9, :cond_3

    .line 283
    const-string v9, "GSM"

    const-string v11, "Received short message on device which doesn\'t support SMS service. Ignored."

    invoke-static {v9, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 290
    :cond_3
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    invoke-static {v9, p1}, Lcom/android/internal/telephony/HtcMessageHelper;->checkSmsDuplication(Landroid/content/Context;Lcom/android/internal/telephony/SmsMessageBase;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 296
    const/4 v0, 0x0

    .line 297
    .local v0, handled:Z
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isMWISetMessage()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 299
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getMwiCounter()I

    move-result v12

    invoke-interface {v9, v10, v12}, Lcom/android/internal/telephony/Phone;->setVoiceMessageWaiting(II)V

    .line 300
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isMwiDontStore()Z

    move-result v0

    .line 302
    const-string v12, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received voice mail indicator set SMS shouldStore="

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    if-nez v0, :cond_6

    move v9, v10

    :goto_1
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    :cond_4
    :goto_2
    if-nez v0, :cond_0

    .line 329
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

    invoke-virtual {v9}, Lcom/android/internal/telephony/SmsStorageMonitor;->isStorageAvailable()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-static {}, Lcom/android/internal/telephony/SMSDispatcher;->getEasAllowSms()Z

    move-result v9

    if-nez v9, :cond_9

    :cond_5
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getMessageClass()Landroid/telephony/SmsMessage$MessageClass;

    move-result-object v9

    sget-object v12, Landroid/telephony/SmsMessage$MessageClass;->CLASS_0:Landroid/telephony/SmsMessage$MessageClass;

    if-eq v9, v12, :cond_9

    .line 333
    const/4 v10, 0x3

    goto :goto_0

    :cond_6
    move v9, v11

    .line 302
    goto :goto_1

    .line 304
    :cond_7
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isMWIClearMessage()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 305
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v9, v10, v11}, Lcom/android/internal/telephony/Phone;->setVoiceMessageWaiting(II)V

    .line 306
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isMwiDontStore()Z

    move-result v0

    .line 308
    const-string v12, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received voice mail indicator clear SMS shouldStore="

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    if-nez v0, :cond_8

    move v9, v10

    :goto_3
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    if-eqz v0, :cond_4

    sget-short v9, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v12, 0xa9

    if-ne v9, v12, :cond_4

    .line 314
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getProtocolIdentifier()I

    move-result v5

    .line 315
    .local v5, pid:I
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->isMwiDontStore()Z

    move-result v9

    if-eqz v9, :cond_4

    const/16 v9, 0x41

    if-ne v5, v9, :cond_4

    .line 317
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 318
    .local v1, intent:Landroid/content/Intent;
    const-string v9, "com.android.mms.transaction.HTC_MWICLEAR_RECEIVE"

    invoke-virtual {v1, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 319
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {v9, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_2

    .end local v1           #intent:Landroid/content/Intent;
    .end local v5           #pid:I
    :cond_8
    move v9, v11

    .line 308
    goto :goto_3

    .line 336
    :cond_9
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v7

    .line 338
    .local v7, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    if-eqz v7, :cond_a

    iget-object v9, v7, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    if-nez v9, :cond_f

    .line 340
    :cond_a
    new-array v4, v10, [[B

    .line 341
    .local v4, pdus:[[B
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getPdu()[B

    move-result-object v9

    aput-object v9, v4, v11

    .line 343
    if-eqz v7, :cond_c

    iget-object v9, v7, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    if-eqz v9, :cond_c

    .line 344
    iget-object v9, v7, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v9, v9, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    const/16 v10, 0xb84

    if-ne v9, v10, :cond_b

    .line 345
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mWapPush:Lcom/android/internal/telephony/WapPushOverSms;

    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getUserData()[B

    move-result-object v10

    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu([BLjava/lang/String;)I

    move-result v10

    goto/16 :goto_0

    .line 348
    :cond_b
    iget-object v9, v7, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v9, v9, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    invoke-virtual {p0, v4, v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->dispatchPortAddressedPdus([[BI)V

    .line 381
    :goto_4
    const/4 v10, -0x1

    goto/16 :goto_0

    .line 354
    :cond_c
    const/4 v3, 0x0

    .line 355
    .local v3, isLBSMessage:Z
    sget-short v9, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v11, 0xa8

    if-ne v9, v11, :cond_e

    .line 357
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v8

    .line 359
    .local v8, str:Ljava/lang/String;
    if-eqz v8, :cond_e

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v11, 0x6

    if-lt v9, v11, :cond_e

    const-string v9, "//VZW"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_e

    const-string v9, "//VZW"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_e

    .line 362
    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->checkVZWDirectedSMS(Ljava/lang/String;)Z

    move-result v9

    if-ne v9, v10, :cond_d

    .line 363
    const-string v9, "GSM"

    const-string v11, "VZW GSM Directed SMS true, return handled"

    invoke-static {v9, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 366
    :cond_d
    const/4 v3, 0x1

    .line 367
    const-string v9, "GSM"

    const-string v10, "SMSdispatch/ isLBSMessage"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    .end local v8           #str:Ljava/lang/String;
    :cond_e
    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->isFromEVDO()Z

    move-result v2

    .line 376
    .local v2, isEVDOMessage:Z
    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->getIndexOnIcc()I

    move-result v9

    invoke-virtual {p0, v9, v4, v3, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->dispatchPdus(I[[BZZ)V

    goto :goto_4

    .line 384
    .end local v2           #isEVDOMessage:Z
    .end local v3           #isLBSMessage:Z
    .end local v4           #pdus:[[B
    :cond_f
    iget-object v9, v7, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget-object v10, v7, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    invoke-virtual {p0, v6, v9, v10}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->processMessagePart(Lcom/android/internal/telephony/SmsMessageBase;Lcom/android/internal/telephony/SmsHeader$ConcatRef;Lcom/android/internal/telephony/SmsHeader$PortAddrs;)I

    move-result v10

    goto/16 :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 131
    invoke-super {p0}, Lcom/android/internal/telephony/SMSDispatcher;->dispose()V

    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mGsmPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 133
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0, p0}, Lcom/android/internal/telephony/CommandsInterface;->unSetOnNewGsmSms(Landroid/os/Handler;)V

    .line 135
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0, p0}, Lcom/android/internal/telephony/CommandsInterface;->unSetOnNewGsmBroadcastSms(Landroid/os/Handler;)V

    .line 136
    return-void
.end method

.method protected finalize()V
    .locals 2

    .prologue
    .line 144
    const-string v0, "GSM"

    const-string v1, "GsmSMSDispatcher finalized"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    return-void
.end method

.method protected getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    const-string v0, "3gpp"

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 156
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 167
    invoke-super {p0, p1}, Lcom/android/internal/telephony/SMSDispatcher;->handleMessage(Landroid/os/Message;)V

    .line 169
    :goto_0
    return-void

    .line 163
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->handleBroadcastSms(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 156
    nop

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method

.method public handleStatusReport(Landroid/os/AsyncResult;)V
    .locals 13
    .parameter "ar"

    .prologue
    const/4 v12, 0x1

    .line 184
    invoke-static {}, Lcom/android/internal/telephony/HtcMsgConfig;->isPendingMsgRepoEnabled()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 185
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->htcHandleGsmStatusReport(Landroid/os/AsyncResult;)V

    .line 216
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v5, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .line 190
    .local v5, pduString:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/internal/telephony/gsm/SmsMessage;->newFromCDS(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage;

    move-result-object v6

    .line 192
    .local v6, sms:Lcom/android/internal/telephony/gsm/SmsMessage;
    if-eqz v6, :cond_2

    .line 193
    invoke-virtual {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->getStatus()I

    move-result v7

    .line 194
    .local v7, tpStatus:I
    iget v4, v6, Lcom/android/internal/telephony/SmsMessageBase;->messageRef:I

    .line 195
    .local v4, messageRef:I
    const-string v9, "GSM"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "handleStatusReport: messageRef> "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const/4 v2, 0x0

    .local v2, i:I
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, count:I
    :goto_1
    if-ge v2, v0, :cond_2

    .line 197
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .line 198
    .local v8, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    iget v9, v8, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    if-ne v9, v4, :cond_3

    .line 200
    const/16 v9, 0x22

    if-eq v7, v9, :cond_1

    const/16 v9, 0x30

    if-eq v7, v9, :cond_1

    .line 201
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 202
    :cond_1
    iget-object v3, v8, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mDeliveryIntent:Landroid/app/PendingIntent;

    .line 203
    .local v3, intent:Landroid/app/PendingIntent;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 204
    .local v1, fillIn:Landroid/content/Intent;
    const-string v9, "pdu"

    invoke-static {v5}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v10

    invoke-virtual {v1, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 205
    const-string v9, "format"

    const-string v10, "3gpp"

    invoke-virtual {v1, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 207
    :try_start_0
    iget-object v9, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    const/4 v10, -0x1

    invoke-virtual {v3, v9, v10, v1}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    .end local v0           #count:I
    .end local v1           #fillIn:Landroid/content/Intent;
    .end local v2           #i:I
    .end local v3           #intent:Landroid/app/PendingIntent;
    .end local v4           #messageRef:I
    .end local v7           #tpStatus:I
    .end local v8           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_2
    :goto_2
    const/4 v9, 0x0

    invoke-virtual {p0, v12, v12, v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    goto :goto_0

    .line 196
    .restart local v0       #count:I
    .restart local v2       #i:I
    .restart local v4       #messageRef:I
    .restart local v7       #tpStatus:I
    .restart local v8       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 208
    .restart local v1       #fillIn:Landroid/content/Intent;
    .restart local v3       #intent:Landroid/app/PendingIntent;
    :catch_0
    move-exception v9

    goto :goto_2
.end method

.method protected htcHandleGsmStatusReport(Landroid/os/AsyncResult;)V
    .locals 13
    .parameter "ar"

    .prologue
    .line 220
    iget-object v5, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .line 221
    .local v5, pduString:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/internal/telephony/gsm/SmsMessage;->newFromCDS(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage;

    move-result-object v8

    .line 222
    .local v8, sms:Lcom/android/internal/telephony/gsm/SmsMessage;
    if-eqz v8, :cond_2

    .line 223
    iget v4, v8, Lcom/android/internal/telephony/SmsMessageBase;->messageRef:I

    .line 224
    .local v4, messageRef:I
    const/4 v6, -0x1

    .line 225
    .local v6, pos:I
    const/4 v9, 0x0

    .line 227
    .local v9, tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->getStatus()I

    move-result v10

    const/16 v11, 0x22

    if-eq v10, v11, :cond_3

    invoke-virtual {v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->getStatus()I

    move-result v10

    const/16 v11, 0x30

    if-eq v10, v11, :cond_3

    const/4 v7, 0x1

    .line 228
    .local v7, remove:Z
    :goto_0
    const-string v10, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "htcHandleStatusReport: messageRef> "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    const/4 v2, 0x0

    .local v2, i:I
    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, count:I
    :goto_1
    if-ge v2, v0, :cond_0

    .line 230
    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    check-cast v9, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .line 231
    .restart local v9       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    iget v10, v9, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    if-ne v10, v4, :cond_4

    .line 232
    move v6, v2

    .line 238
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 239
    .local v1, fillIn:Landroid/content/Intent;
    const-string v10, "pdu"

    invoke-static {v5}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 240
    const-string v10, "format"

    const-string v11, "3gpp"

    invoke-virtual {v1, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    const/4 v10, -0x1

    if-le v6, v10, :cond_5

    .line 242
    iget-object v3, v9, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mDeliveryIntent:Landroid/app/PendingIntent;

    .line 244
    .local v3, intent:Landroid/app/PendingIntent;
    :try_start_0
    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    const/4 v11, -0x1

    invoke-virtual {v3, v10, v11, v1}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    .end local v3           #intent:Landroid/app/PendingIntent;
    :goto_2
    if-eqz v7, :cond_2

    .line 251
    const/4 v10, -0x1

    if-le v6, v10, :cond_1

    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->deliveryPendingList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 253
    :cond_1
    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    invoke-static {v10, v4}, Lcom/android/internal/telephony/HtcMessageHelper;->deleteMsgRefFromPendingList(Landroid/content/Context;I)I

    .line 256
    .end local v0           #count:I
    .end local v1           #fillIn:Landroid/content/Intent;
    .end local v2           #i:I
    .end local v4           #messageRef:I
    .end local v6           #pos:I
    .end local v7           #remove:Z
    .end local v9           #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_2
    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-virtual {p0, v10, v11, v12}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 257
    return-void

    .line 227
    .restart local v4       #messageRef:I
    .restart local v6       #pos:I
    .restart local v9       #tracker:Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_3
    const/4 v7, 0x0

    goto :goto_0

    .line 229
    .restart local v0       #count:I
    .restart local v2       #i:I
    .restart local v7       #remove:Z
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 247
    .restart local v1       #fillIn:Landroid/content/Intent;
    :cond_5
    iget-object v10, p0, Lcom/android/internal/telephony/SMSDispatcher;->mContext:Landroid/content/Context;

    invoke-static {v10, v4, v1}, Lcom/android/internal/telephony/HtcMessageHelper;->sendPendingIntent(Landroid/content/Context;ILandroid/content/Intent;)V

    goto :goto_2

    .line 245
    .restart local v3       #intent:Landroid/app/PendingIntent;
    :catch_0
    move-exception v10

    goto :goto_2
.end method

.method protected htcSendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;[B[BLandroid/os/Message;ZZ)Z
    .locals 8
    .parameter "tracker"
    .parameter "smsc"
    .parameter "pdu"
    .parameter "reply"
    .parameter "bFirstOfAll"
    .parameter "bLastOfAll"

    .prologue
    const/4 v0, 0x0

    const/4 v7, 0x1

    .line 963
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->VERIZON_LTE_CONFIG()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 964
    const-string v1, "GSM"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendSms(), mImsRadioTech = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mImsRadioTech:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 966
    iget-object v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRawPdu:[B

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRawPdu:[B

    aget-byte v1, v1, v7

    if-nez v1, :cond_1

    .line 967
    :cond_0
    if-eqz p3, :cond_1

    array-length v1, p3

    if-le v1, v7, :cond_1

    .line 968
    array-length v1, p3

    new-array v1, v1, [B

    iput-object v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRawPdu:[B

    .line 969
    iget-object v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRawPdu:[B

    array-length v2, p3

    invoke-static {p3, v0, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 978
    :cond_1
    iget v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    if-eqz v1, :cond_2

    iget v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_7

    .line 979
    :cond_2
    iget-object v1, p0, Lcom/android/internal/telephony/SMSDispatcher;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v6

    .line 986
    .local v6, ss:I
    const-string v1, "gsm.volte.ims.emulate.no_radio"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-ne v0, v7, :cond_3

    .line 987
    const/4 v6, 0x1

    .line 993
    :cond_3
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->isImsAvailable()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1001
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {p2}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p4}, Lcom/android/internal/telephony/CommandsInterface;->sendImsGsmSms(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .end local v6           #ss:I
    :cond_4
    :goto_0
    move v0, v7

    .line 1024
    :cond_5
    return v0

    .line 1006
    .restart local v6       #ss:I
    :cond_6
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {p2}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    move-object v3, p4

    move v4, p5

    move v5, p6

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;ZZ)V

    goto :goto_0

    .line 1008
    .end local v6           #ss:I
    :cond_7
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    if-eq v0, v7, :cond_8

    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_8

    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_8

    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 1010
    :cond_8
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {p2}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    move-object v3, p4

    move v4, p5

    move v5, p6

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;ZZ)V

    goto :goto_0

    .line 1015
    :cond_9
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->KDDI_LTE_CONFIG()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1018
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendSms(), mImsRadioTech = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mImsRadioTech:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {p2}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p4}, Lcom/android/internal/telephony/CommandsInterface;->sendImsGsmSms(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method public sendData(Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .locals 9
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "destPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    const/4 v5, 0x0

    .line 399
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->VERIZON_LTE_CONFIG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 400
    invoke-direct/range {p0 .. p6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendDataVZWLTE(Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 411
    :goto_0
    return-void

    .line 404
    :cond_0
    if-eqz p6, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {p2, p1, p3, p4, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;I[BZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v8

    .line 406
    .local v8, pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v8, :cond_2

    .line 407
    iget-object v1, v8, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    iget-object v2, v8, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    move-object v0, p0

    move-object v3, p5

    move-object v4, p6

    move v6, v5

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPdu([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLjava/lang/String;)V

    goto :goto_0

    .end local v8           #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    move v0, v5

    .line 404
    goto :goto_1

    .line 409
    .restart local v8       #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_2
    const-string v0, "GSM"

    const-string v1, "GsmSMSDispatcher.sendData(): getSubmitPdu() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public sendMultipartData(Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/os/Bundle;)V
    .locals 26
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "destPort"
    .parameter
    .parameter
    .parameter
    .parameter "bundle"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 497
    .local p4, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p5, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p6, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/16 v16, 0x0

    .line 498
    .local v16, bFirstSms:Z
    const/16 v17, 0x0

    .line 499
    .local v17, bLastSms:Z
    if-eqz p7, :cond_0

    .line 500
    const-string v3, "FIRST_SMS"

    const/4 v4, 0x0

    move-object/from16 v0, p7

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v16

    .line 501
    const-string v3, "LAST_SMS"

    const/4 v4, 0x0

    move-object/from16 v0, p7

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    .line 504
    :cond_0
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->getNextConcatenatedRef()I

    move-result v3

    and-int/lit16 v0, v3, 0xff

    move/from16 v24, v0

    .line 505
    .local v24, refNumber:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    long-to-int v0, v3

    move/from16 v20, v0

    .line 507
    .local v20, concatedDate:I
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v22

    .line 508
    .local v22, msgCount:I
    const/16 v21, 0x0

    .local v21, i:I
    :goto_0
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_e

    .line 509
    new-instance v18, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct/range {v18 .. v18}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 510
    .local v18, concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v24

    move-object/from16 v1, v18

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 511
    add-int/lit8 v3, v21, 0x1

    move-object/from16 v0, v18

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 512
    move/from16 v0, v22

    move-object/from16 v1, v18

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 513
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput-boolean v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->isEightBits:Z

    .line 514
    new-instance v6, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v6}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 515
    .local v6, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move-object/from16 v0, v18

    iput-object v0, v6, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    .line 518
    invoke-static {v6}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v25

    .line 521
    .local v25, smsHeaderData:[B
    const/4 v10, 0x0

    .line 522
    .local v10, sentIntent:Landroid/app/PendingIntent;
    if-eqz p5, :cond_1

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v21

    if-le v3, v0, :cond_1

    .line 523
    move-object/from16 v0, p5

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10           #sentIntent:Landroid/app/PendingIntent;
    check-cast v10, Landroid/app/PendingIntent;

    .line 526
    .restart local v10       #sentIntent:Landroid/app/PendingIntent;
    :cond_1
    const/4 v11, 0x0

    .line 527
    .local v11, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p6, :cond_2

    invoke-virtual/range {p6 .. p6}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v21

    if-le v3, v0, :cond_2

    .line 528
    move-object/from16 v0, p6

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v11, Landroid/app/PendingIntent;

    .line 532
    .restart local v11       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_2
    new-instance v19, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct/range {v19 .. v19}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 533
    .local v19, concatRef1:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v24

    move-object/from16 v1, v19

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 534
    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    add-int/lit8 v3, v3, 0x0

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 535
    move-object/from16 v0, v18

    iget v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    add-int/lit8 v3, v3, 0x0

    move-object/from16 v0, v19

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 537
    const-string v3, "Concate"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insertRawTable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    sget-object v3, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mConcatedutil:Lcom/android/internal/telephony/ConcatedUtil;

    const/4 v4, 0x4

    move/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v3, v0, v1, v2, v4}, Lcom/android/internal/telephony/ConcatedUtil;->insertRawTable(ILjava/lang/String;Lcom/android/internal/telephony/SmsHeader$ConcatRef;I)I

    .line 541
    new-instance v14, Landroid/os/Bundle;

    invoke-direct {v14}, Landroid/os/Bundle;-><init>()V

    .line 542
    .local v14, concateBundle:Landroid/os/Bundle;
    const-string v3, "REFERENCE_NUMBER"

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    invoke-virtual {v14, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 543
    const-string v3, "COUNT"

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    invoke-virtual {v14, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 544
    const-string v3, "SEQUENCE"

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    invoke-virtual {v14, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 545
    const-string v3, "DESTADDR"

    move-object/from16 v0, p1

    invoke-virtual {v14, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    const-string v3, "DATE"

    move/from16 v0, v20

    invoke-virtual {v14, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 549
    const-string v3, "DEST_ADDRESS"

    move-object/from16 v0, p1

    invoke-virtual {v14, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    move-object/from16 v0, p4

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v11, :cond_3

    const/4 v8, 0x1

    :goto_1
    move-object/from16 v3, p2

    move-object/from16 v4, p1

    move/from16 v5, p3

    invoke-static/range {v3 .. v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;ILcom/android/internal/telephony/SmsHeader;Ljava/lang/String;Z)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v23

    .line 555
    .local v23, pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p7, :cond_a

    .line 556
    const/4 v3, 0x1

    move/from16 v0, v16

    if-ne v0, v3, :cond_7

    const/4 v3, 0x1

    move/from16 v0, v17

    if-ne v0, v3, :cond_7

    .line 557
    const/4 v3, 0x1

    move/from16 v0, v22

    if-ne v0, v3, :cond_4

    .line 558
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 508
    :goto_2
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_0

    .line 552
    .end local v23           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_3
    const/4 v8, 0x0

    goto :goto_1

    .line 559
    .restart local v23       #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_4
    if-nez v21, :cond_5

    .line 560
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x1

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 561
    :cond_5
    add-int/lit8 v3, v22, -0x1

    move/from16 v0, v21

    if-ne v0, v3, :cond_6

    .line 562
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x1

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 564
    :cond_6
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 565
    :cond_7
    if-nez v21, :cond_8

    const/4 v3, 0x1

    move/from16 v0, v16

    if-ne v0, v3, :cond_8

    .line 566
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x1

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 567
    :cond_8
    add-int/lit8 v3, v22, -0x1

    move/from16 v0, v21

    if-ne v0, v3, :cond_9

    const/4 v3, 0x1

    move/from16 v0, v17

    if-ne v0, v3, :cond_9

    .line 568
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x1

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_2

    .line 570
    :cond_9
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 572
    :cond_a
    if-nez v21, :cond_b

    const/4 v3, 0x1

    move/from16 v0, v22

    if-ne v0, v3, :cond_b

    .line 573
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 574
    :cond_b
    if-nez v21, :cond_c

    .line 575
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x1

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 576
    :cond_c
    add-int/lit8 v3, v22, -0x1

    move/from16 v0, v21

    if-ne v0, v3, :cond_d

    .line 577
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x1

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 579
    :cond_d
    move-object/from16 v0, v23

    iget-object v8, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v23

    iget-object v9, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v15, p1

    invoke-virtual/range {v7 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 582
    .end local v6           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v10           #sentIntent:Landroid/app/PendingIntent;
    .end local v11           #deliveryIntent:Landroid/app/PendingIntent;
    .end local v14           #concateBundle:Landroid/os/Bundle;
    .end local v18           #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v19           #concatRef1:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v23           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v25           #smsHeaderData:[B
    :cond_e
    return-void
.end method

.method public sendMultipartSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 8
    .parameter "tracker"

    .prologue
    .line 1072
    iget-object v7, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mData:Ljava/util/HashMap;

    .line 1074
    .local v7, map:Ljava/util/HashMap;
    const-string v0, "destination"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1075
    .local v1, destinationAddress:Ljava/lang/String;
    const-string v0, "scaddress"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1077
    .local v2, scAddress:Ljava/lang/String;
    const-string v0, "parts"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 1078
    .local v3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v0, "sentIntents"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 1079
    .local v4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const-string v0, "deliveryIntents"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 1082
    .local v5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v6, -0x1

    .line 1083
    .local v6, nli:I
    const-string v0, "nli"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    move-object v0, p0

    .line 1088
    invoke-direct/range {v0 .. v6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendMultipartTextWithPermit(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 1092
    return-void
.end method

.method protected sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 7
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 482
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/os/Bundle;)V

    .line 483
    return-void
.end method

.method public sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/os/Bundle;)V
    .locals 35
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "bundle"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 599
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v8, -0x1

    .line 600
    .local v8, nli:I
    const/16 v19, 0x0

    .line 601
    .local v19, bFirstSms:Z
    const/16 v20, 0x0

    .line 602
    .local v20, bLastSms:Z
    if-eqz p6, :cond_0

    .line 603
    const-string v3, "NLI"

    const/4 v4, -0x1

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 604
    const-string v3, "FIRST_SMS"

    const/4 v4, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    .line 605
    const-string v3, "LAST_SMS"

    const/4 v4, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v20

    .line 610
    :cond_0
    const/4 v9, 0x1

    .line 612
    .local v9, is7bitOnly:Z
    const/16 v28, 0x0

    .local v28, i:I
    :goto_0
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v28

    if-ge v0, v3, :cond_1

    .line 613
    move-object/from16 v0, p3

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x1

    invoke-static {v3, v4, v8}, Lcom/android/internal/telephony/GsmAlphabet;->countGsmSeptets(Ljava/lang/CharSequence;ZI)I

    move-result v33

    .line 614
    .local v33, septetCount:I
    const/16 v3, 0xff

    move/from16 v0, v33

    if-le v0, v3, :cond_4

    .line 615
    new-instance v3, Lcom/android/internal/telephony/EncodeException;

    const-string v4, "error"

    invoke-direct {v3, v4}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 618
    .end local v33           #septetCount:I
    :catch_0
    move-exception v26

    .line 620
    .local v26, e:Lcom/android/internal/telephony/EncodeException;
    const/4 v9, 0x0

    .line 624
    .end local v26           #e:Lcom/android/internal/telephony/EncodeException;
    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->getNextConcatenatedRef()I

    move-result v3

    and-int/lit16 v0, v3, 0xff

    move/from16 v32, v0

    .line 625
    .local v32, refNumber:I
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v30

    .line 626
    .local v30, msgCount:I
    const/16 v27, 0x0

    .line 627
    .local v27, encoding:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    long-to-int v0, v3

    move/from16 v23, v0

    .line 629
    .local v23, concatedDate:I
    const/16 v28, 0x0

    :goto_1
    move/from16 v0, v28

    move/from16 v1, v30

    if-ge v0, v1, :cond_5

    .line 630
    move-object/from16 v0, p3

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/android/internal/telephony/gsm/SmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;

    move-result-object v25

    .line 631
    .local v25, details:Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;
    move-object/from16 v0, v25

    iget v3, v0, Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;->codeUnitSize:I

    move/from16 v0, v27

    if-eq v0, v3, :cond_3

    if-eqz v27, :cond_2

    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_3

    .line 634
    :cond_2
    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;->codeUnitSize:I

    move/from16 v27, v0

    .line 629
    :cond_3
    add-int/lit8 v28, v28, 0x1

    goto :goto_1

    .line 612
    .end local v23           #concatedDate:I
    .end local v25           #details:Lcom/android/internal/telephony/SmsMessageBase$TextEncodingDetails;
    .end local v27           #encoding:I
    .end local v30           #msgCount:I
    .end local v32           #refNumber:I
    .restart local v33       #septetCount:I
    :cond_4
    add-int/lit8 v28, v28, 0x1

    goto :goto_0

    .line 638
    .end local v33           #septetCount:I
    .restart local v23       #concatedDate:I
    .restart local v27       #encoding:I
    .restart local v30       #msgCount:I
    .restart local v32       #refNumber:I
    :cond_5
    const/16 v28, 0x0

    :goto_2
    move/from16 v0, v28

    move/from16 v1, v30

    if-ge v0, v1, :cond_15

    .line 639
    new-instance v21, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct/range {v21 .. v21}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 640
    .local v21, concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v32

    move-object/from16 v1, v21

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 641
    add-int/lit8 v3, v28, 0x1

    move-object/from16 v0, v21

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 642
    move/from16 v0, v30

    move-object/from16 v1, v21

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 649
    const/4 v3, 0x1

    move-object/from16 v0, v21

    iput-boolean v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->isEightBits:Z

    .line 650
    new-instance v34, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct/range {v34 .. v34}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 651
    .local v34, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move-object/from16 v0, v21

    move-object/from16 v1, v34

    iput-object v0, v1, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    .line 654
    const/4 v3, -0x1

    if-eq v8, v3, :cond_7

    .line 655
    const/4 v3, 0x1

    new-array v0, v3, [B

    move-object/from16 v24, v0

    .line 656
    .local v24, data:[B
    const/4 v3, 0x0

    int-to-byte v4, v8

    aput-byte v4, v24, v3

    .line 657
    new-instance v29, Lcom/android/internal/telephony/SmsHeader$MiscElt;

    invoke-direct/range {v29 .. v29}, Lcom/android/internal/telephony/SmsHeader$MiscElt;-><init>()V

    .line 659
    .local v29, miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    const/16 v3, 0xe

    if-eq v8, v3, :cond_6

    .line 660
    const/16 v3, 0x24

    move-object/from16 v0, v29

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->id:I

    .line 661
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    iput-object v0, v1, Lcom/android/internal/telephony/SmsHeader$MiscElt;->data:[B

    .line 662
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->miscEltList:Ljava/util/ArrayList;

    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    :cond_6
    const/4 v3, 0x3

    if-ne v8, v3, :cond_7

    .line 666
    new-instance v29, Lcom/android/internal/telephony/SmsHeader$MiscElt;

    .end local v29           #miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    invoke-direct/range {v29 .. v29}, Lcom/android/internal/telephony/SmsHeader$MiscElt;-><init>()V

    .line 667
    .restart local v29       #miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    const/16 v3, 0x25

    move-object/from16 v0, v29

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$MiscElt;->id:I

    .line 668
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    iput-object v0, v1, Lcom/android/internal/telephony/SmsHeader$MiscElt;->data:[B

    .line 669
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->miscEltList:Ljava/util/ArrayList;

    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 674
    .end local v24           #data:[B
    .end local v29           #miscElt:Lcom/android/internal/telephony/SmsHeader$MiscElt;
    :cond_7
    const/4 v13, 0x0

    .line 675
    .local v13, sentIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_8

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v28

    if-le v3, v0, :cond_8

    .line 676
    move-object/from16 v0, p4

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13           #sentIntent:Landroid/app/PendingIntent;
    check-cast v13, Landroid/app/PendingIntent;

    .line 680
    .restart local v13       #sentIntent:Landroid/app/PendingIntent;
    :cond_8
    new-instance v22, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct/range {v22 .. v22}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 681
    .local v22, concatRef1:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v32

    move-object/from16 v1, v22

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 682
    move-object/from16 v0, v21

    iget v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    add-int/lit8 v3, v3, 0x0

    move-object/from16 v0, v22

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 683
    move-object/from16 v0, v21

    iget v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    add-int/lit8 v3, v3, 0x0

    move-object/from16 v0, v22

    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 685
    const-string v3, "Concate"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insertRawTable: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    sget-object v3, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->mConcatedutil:Lcom/android/internal/telephony/ConcatedUtil;

    const/4 v4, 0x4

    move/from16 v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v3, v0, v1, v2, v4}, Lcom/android/internal/telephony/ConcatedUtil;->insertRawTable(ILjava/lang/String;Lcom/android/internal/telephony/SmsHeader$ConcatRef;I)I

    .line 689
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 690
    .local v17, concateBundle:Landroid/os/Bundle;
    const-string v3, "REFERENCE_NUMBER"

    move-object/from16 v0, v22

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 691
    const-string v3, "COUNT"

    move-object/from16 v0, v22

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 692
    const-string v3, "SEQUENCE"

    move-object/from16 v0, v22

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 693
    const-string v3, "DESTADDR"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    const-string v3, "DATE"

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 697
    const-string v3, "DEST_ADDRESS"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    const/4 v14, 0x0

    .line 701
    .local v14, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p5, :cond_9

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v28

    if-le v3, v0, :cond_9

    .line 702
    move-object/from16 v0, p5

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v14, Landroid/app/PendingIntent;

    .line 706
    .restart local v14       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_9
    move-object/from16 v0, p3

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v14, :cond_a

    const/4 v6, 0x1

    :goto_3
    invoke-static/range {v34 .. v34}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v7

    move-object/from16 v3, p2

    move-object/from16 v4, p1

    invoke-static/range {v3 .. v9}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v31

    .line 711
    .local v31, pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p6, :cond_11

    .line 712
    const/4 v3, 0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_e

    const/4 v3, 0x1

    move/from16 v0, v20

    if-ne v0, v3, :cond_e

    .line 713
    const/4 v3, 0x1

    move/from16 v0, v30

    if-ne v0, v3, :cond_b

    .line 714
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    .line 638
    :goto_4
    add-int/lit8 v28, v28, 0x1

    goto/16 :goto_2

    .line 706
    .end local v31           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_a
    const/4 v6, 0x0

    goto :goto_3

    .line 715
    .restart local v31       #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_b
    if-nez v28, :cond_c

    .line 716
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_4

    .line 717
    :cond_c
    add-int/lit8 v3, v30, -0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_d

    .line 718
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x1

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_4

    .line 720
    :cond_d
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_4

    .line 721
    :cond_e
    if-nez v28, :cond_f

    const/4 v3, 0x1

    move/from16 v0, v19

    if-ne v0, v3, :cond_f

    .line 722
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_4

    .line 723
    :cond_f
    add-int/lit8 v3, v30, -0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_10

    const/4 v3, 0x1

    move/from16 v0, v20

    if-ne v0, v3, :cond_10

    .line 724
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x1

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto :goto_4

    .line 726
    :cond_10
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 728
    :cond_11
    if-nez v28, :cond_12

    const/4 v3, 0x1

    move/from16 v0, v30

    if-ne v0, v3, :cond_12

    .line 729
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 730
    :cond_12
    if-nez v28, :cond_13

    .line 731
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 732
    :cond_13
    add-int/lit8 v3, v30, -0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_14

    .line 733
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x1

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 735
    :cond_14
    move-object/from16 v0, v31

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    move-object/from16 v0, v31

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v18, p1

    invoke-virtual/range {v10 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPduWithBundle([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLandroid/os/Bundle;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 739
    .end local v13           #sentIntent:Landroid/app/PendingIntent;
    .end local v14           #deliveryIntent:Landroid/app/PendingIntent;
    .end local v17           #concateBundle:Landroid/os/Bundle;
    .end local v21           #concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v22           #concatRef1:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v31           #pdus:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v34           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_15
    return-void
.end method

.method public sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;ZZ)V
    .locals 12
    .parameter "tracker"
    .parameter "bFirstOfAll"
    .parameter "bLastOfAll"

    .prologue
    const/4 v5, 0x1

    .line 926
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->checkInSegmentToRIL(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 928
    iget-object v11, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mData:Ljava/util/HashMap;

    .line 930
    .local v11, map:Ljava/util/HashMap;
    const-string v0, "smsc"

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move-object v2, v0

    check-cast v2, [B

    .line 931
    .local v2, smsc:[B
    const-string v0, "pdu"

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move-object v3, v0

    check-cast v3, [B

    .line 934
    .local v3, pdu:[B
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    if-ne v0, v5, :cond_0

    .line 935
    if-eqz v3, :cond_0

    array-length v0, v3

    if-lez v0, :cond_0

    .line 937
    const/4 v0, 0x0

    aget-byte v1, v3, v0

    or-int/lit8 v1, v1, 0x4

    int-to-byte v1, v1

    aput-byte v1, v3, v0

    .line 941
    :cond_0
    if-eqz v3, :cond_1

    array-length v0, v3

    if-lez v0, :cond_1

    .line 943
    aget-byte v0, v3, v5

    iget v1, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mTpMrForRetry:I

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-byte v0, v0

    aput-byte v0, v3, v5

    .line 947
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .local v4, reply:Landroid/os/Message;
    move-object v0, p0

    move-object v1, p1

    move v5, p2

    move v6, p3

    .line 949
    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->htcSendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;[B[BLandroid/os/Message;ZZ)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 956
    :goto_0
    return-void

    .line 954
    :cond_2
    iget-object v5, p0, Lcom/android/internal/telephony/SMSDispatcher;->mCm:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v2}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    move-object v8, v4

    move v9, p2

    move v10, p3

    invoke-interface/range {v5 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;ZZ)V

    goto :goto_0
.end method

.method public sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/os/Bundle;)V
    .locals 9
    .parameter "destAddr"
    .parameter "scAddr"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "bundle"

    .prologue
    const/4 v5, 0x0

    .line 444
    invoke-static {}, Lcom/android/internal/telephony/HtcBuildUtils;->VERIZON_LTE_CONFIG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 445
    invoke-direct/range {p0 .. p6}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendTextVZWLTE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/os/Bundle;)V

    .line 456
    :goto_0
    return-void

    .line 449
    :cond_0
    if-eqz p5, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {p2, p1, p3, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v8

    .line 451
    .local v8, pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v8, :cond_2

    .line 452
    iget-object v1, v8, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    iget-object v2, v8, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    move-object v0, p0

    move-object v3, p4

    move-object v4, p5

    move v6, v5

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendRawPdu([B[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLjava/lang/String;)V

    goto :goto_0

    .end local v8           #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    move v0, v5

    .line 449
    goto :goto_1

    .line 454
    .restart local v8       #pdu:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_2
    const-string v0, "GSM"

    const-string v1, "GsmSMSDispatcher.sendText(): getSubmitPdu() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
