Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C82C3ABCC
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXXD+89fOrvje0rUDX4jxvrEkDyP09DcE9CMoP/b3eo=; b=fVb37abOptKor8
	zUQYaOv1Sz3ydrOT3iPRroSYsbV4iOOZXczePGYo2bqLWtbj+JTE+2J29BMoswcFCSL8IV7Rqg4Io
	ah8/OfaM42+FESK6SWfR0Lfy19lhQlKCINdRqNFBeOYjy9lgzRn6+9Ffgbqz1nYcB04SVDjI4mVQ5
	TX72mIwA+VZhgs9zhfeuzyLI0WtxPLsDhqA/jzEr8bJpl2zkr+ZK8SlxReQjWIrsJ9pGBZko2p9Xr
	CY2iWqOazHIuppqQhE2B9Ee+hntXmy7/4fjz4w+NJx60QNOw4I6gHgBcr8ALZ7/xgvs+OZViac15e
	En9pqf2fSNzZH2tIoRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj3-00000008mu4-0hB2;
	Mon, 12 May 2025 08:41:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOgS-00000008mRv-0Xe8
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:38:49 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742596d8b95so1237424b3a.1
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039127; x=1747643927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaUxnUEHXS6sylNYwyJmkLyZDhb2eUToFBYr46LhUho=;
        b=bpjOgakScUlLjZEuHgFDzyRE2DeUOETF/bqdDrqfJzt0Bq6a07Cizb0cKMTksn/Cnz
         Opf7w8yzBdzgIVrNd/n9c9YgKDMn2j/yoDUJGBcJDSLjK6pYj3CbjVhBZKwte95heUmS
         3IcQk40aJ/aYi5Tt71uWRTMmKWu2KsbLAT/AGvjM/NuEku7oxwExI0GEAVWEVhoBPZk6
         uHRY1D/2uultpurW7ohoAL5440nuscrfyoQF6e3oSJz9DBUsVVrQq8X3TRMDfENtxT4H
         bF37W+faaendmoLHUX9XokD97UeSINOr3nYPaducbHMbP1SMq+bHYm7OW7HDGKm3KKks
         IWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039127; x=1747643927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaUxnUEHXS6sylNYwyJmkLyZDhb2eUToFBYr46LhUho=;
        b=QXWwGvevOWstwB6ZK94V79Hvzs+p1WgdAmrXA12UpJJf7b6e3skJsYuDoq+qAarUsR
         UbzNusmr37MNdK1sQM559mZx/VZztSTq/1/0537Wq+m7cEhkvlLEBPh9gNkmX/MPfeYY
         +uI252TPGSjVz0JmSvf7E3nawkvF+/+67jvbDg70JZT3APOrWkTZIJaFQP1vD9mYhTsv
         +RuwV7vEPvply0gFf1u3Td2+rF+MZItGQ+pReYCS5u+0nrDlMx1AzphahJL5nhyZiSs2
         8rwRlVN0jaf7NwOEYRNq7GRSo9aQm9y3FmvIC4JGiVJaVFqBoqvZcRENW8DO8Q9sK/xH
         S1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVRo46+SyR15IxSv/1YxEixq7Z6TSjKPfLirEyFMago8b4uqwRc6rY4dewiooZYLpo5zUY+7u9N@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyqdo1I/imkcjhmEb2ED7ieZlKO0N3YqNzLmXaI160jbLxKZLV
	V+b37xopEBPrxTnRZ6457ZveA7+rKqGd/IoLgVL6QP967VLv3IuAWLgQJOBxylU=
X-Gm-Gg: ASbGncvX8xfd7AuvbyL5xa5hGdG019RwEbp/MiMfP33Hf9LbKAS9Gt4kvVle25OlSyc
	dgP41grnJE8onm6C/BpxP3S72RNXA4yO6kLIEPNuRG9ZgOfbFnbe1XvjI5r5H7w0Z/M/dbu5Lt/
	haTneArlDLFZ2LdyEDJHoOGCslA79IyR2YMzyALi83pIRrgIwyrimUTiIFDn+CCxCKqLA70slZI
	FGO/ampIouWV8+8hec+8jIQfRuSRj5mqglFk4Vaw2oUM3aRaBbpXD4LRaBlQd0ELhNjYSHoQIQS
	IR61qMhcuXXjx4br6WKziZBStUPW6NfWuA3cceW2/k6syf3Nnre/WInGEjNH1hJmlSD+4n3xQn6
	OzmliXiWC1PYcrUIjUIXV50eW
X-Google-Smtp-Source: AGHT+IE1gb9iP+MYN/BF9htFFzejPXEXM4exTUdRX30/gJ/dVJl0qQYEteyFvUkJdo4LhYfKU1zTdA==
X-Received: by 2002:a05:6a00:2313:b0:736:692e:129 with SMTP id d2e1a72fcca58-7423c0421e7mr18704454b3a.24.1747039127161;
        Mon, 12 May 2025 01:38:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.16.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773dedfsm5520943b3a.72.2025.05.12.01.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/4] lib: utils/mpxy: Remove p2a_db_index from RPMI system MSI attributes
Date: Mon, 12 May 2025 14:08:27 +0530
Message-ID: <20250512083827.804151-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512083827.804151-1-apatel@ventanamicro.com>
References: <20250512083827.804151-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013848_164995_182AFF35 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The discovery of P2A doorbell system MSI index is now through RPMI
shared memory DT node so remove p2a_db_index from RPMI system MSI
attributes and access it as a mailbox channel attribute.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  1 -
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c    | 13 +++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 058b7e90..e0d73882 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -285,7 +285,6 @@ enum rpmi_sysmsi_service_id {
 struct rpmi_sysmsi_get_attributes_resp {
 	s32 status;
 	u32 sys_num_msi;
-	u32 p2a_db_index;
 	u32 flag0;
 	u32 flag1;
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index 87e6aa53..b4bab85a 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -32,10 +32,9 @@ static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
 	case RPMI_SYSMSI_SRV_GET_ATTRIBUTES:
 		((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_SUCCESS);
 		((u32 *)xfer->rx)[1] = cpu_to_le32(smg->sys_num_msi);
-		((u32 *)xfer->rx)[2] = -1U;
+		((u32 *)xfer->rx)[2] = 0;
 		((u32 *)xfer->rx)[3] = 0;
-		((u32 *)xfer->rx)[4] = 0;
-		args->rx_data_len = 5 * sizeof(u32);
+		args->rx_data_len = 4 * sizeof(u32);
 		break;
 	case RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES:
 	case RPMI_SYSMSI_SRV_SET_MSI_STATE:
@@ -90,8 +89,14 @@ static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
 	struct rpmi_sysmsi_get_msi_attributes_req gmareq;
 	struct rpmi_sysmsi_get_attributes_resp garesp;
 	struct mpxy_rpmi_sysmsi *smg;
+	u32 p2a_db_index;
 	int rc, i;
 
+	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_P2A_DOORBELL_SYSMSI_INDEX,
+				     &p2a_db_index);
+	if (rc)
+		return rc;
+
 	rc = rpmi_normal_request_with_status(chan, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
 					     NULL, 0, 0, &garesp, rpmi_u32_count(garesp),
 					     rpmi_u32_count(garesp));
@@ -122,7 +127,7 @@ static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
 			return rc;
 		}
 
-		if (garesp.p2a_db_index == i ||
+		if (p2a_db_index == i ||
 		    (gmaresp.flag0 & RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV))
 			bitmap_set(smg->sys_msi_denied_bmap, i, 1);
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
