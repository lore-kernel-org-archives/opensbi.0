Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC97D6CFAA
	for <opensbi@archiver.kernel.org>; Thu, 22 Jan 2026 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OxE+TyiPuIwtmXTgcaM4SG0xdCgA22BDi5HD/z+fY0=; b=VQmDzMogqUZVBF
	uJWFNqWKSMZvh+XGUDcux9E2qtTpDFF+RrdB+qX3Rwea9kcmK9KSRIubgdbngzovsVcvCcXHCgZIB
	/EPGN8BpZi3HQZE5afWsCnbZoAWoFmhJMyfVBq6XV+5RlC7kgz4uGz/IiIDVFwo6do/P4Dgx/KQb5
	i3Hb4IwnhNcz6nm8Tn7c4zg2/DVgz7dKZ0yGgYxVXx5+o80c6LD4DRO1c/bHsR7D4sQQGRhkWriKs
	ic5vYiRZh4cAXqUavXIUvMfAx2KzyTfEImbCfTS4IGzBwnL8Rg62n5YhyBeQLUtTbRtWBeySEAOP7
	vWNAN7VXXwUPfp3Y/6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4KI-00000007u5o-2UyT;
	Thu, 22 Jan 2026 23:42:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4KG-00000007u5G-3vUW
	for opensbi@lists.infradead.org;
	Thu, 22 Jan 2026 23:42:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fbc305914so1438341f8f.0
        for <opensbi@lists.infradead.org>; Thu, 22 Jan 2026 15:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769125375; x=1769730175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0ExsVn+U89PIUYHux6VmY6c/H+RROl5NvDAlQ3czxo=;
        b=CZBvH3QosLN/d9/B7MksgRnmBc/Hw6jfhsEAvJFlkz3JbO0xMQbnMhn3UQlNERiJ9U
         Qy76y37fGPe9CTOi4P8SBWubAhREzRXbPewkuUKElJ8neI3lduVEbR+i3uT2N40N9hQc
         x1aS4pVE20N/c32H6k19JXZjXtxfDdlMFZI/GH7qwfgiYrUkjTLzglEL40+F3fg7p0zk
         R2LZxSl2bD5pzLj9M5ZXEc2dzgJR3AcJz3A6JO6u3XUvpojaPLSXh1klBEY7sSVnTAbD
         B/HwTnCYK5XOugCIzrgvTVnu5CYDl0wxh+4PhiCgp5l0q39dKRa2CpH+qUyvnOoIOkkK
         +6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769125375; x=1769730175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0ExsVn+U89PIUYHux6VmY6c/H+RROl5NvDAlQ3czxo=;
        b=RYMIcedZIbXaOFpc3inv/4L8DFNEPhE1okFahUvGDa95+Auog962TNCKOoXQIS0K/H
         x3ERMlKi32sD4uspxo/FjQh5WG1o3Gke1xrEnzjuxz1mETaHka2V+fSgEWAAMsJvh12k
         2M/a++ESUgWxwoTQJIOFffj3CPJxRJTHPdeWyTinQlkhVRZK+xxk+vnVUnyJMEn5IMyp
         OIglCBS6QPskzAlRAo6JDeVY5TtknXVEOU5BzGJSi+ClC4QhJVbTK36VjhSV5WcKTb9J
         doVXALu9USUblXX4U8/HKJ0SS96WU6gqD40en2mrrOBeXBPsPPK0pNJ/cbSmSiArp/YM
         XZvg==
X-Gm-Message-State: AOJu0YxLqX8Tli90NkkAATiAwt/DrulguTv0enBTLZ4YhWAl0+mJlT4r
	FX5dbeWFKSEmm13GaI9v0IN/HnMDeZVYsY2OH+3eaEad/0i3HCUJD6fm7SVCog==
X-Gm-Gg: AZuq6aK5OfYst1nU9pNHn2R0ij3R1F88yklHzRjKDrYaWWmt5J1GFyyo+qTOKspiAOC
	UK/Y7eLIoWCr3EtvbpMqiTw3hC/oVausSgZAu5cb7sLsyMMavufamLAQUm5pRcGeuK7KCFFGpDJ
	psy2zgY9IyH1G+mTSi+8KvfFBSVFjZWlVz7uGDYD+uEzP90E0MFfZKd0jdLSRcDQw/1OpdWKN15
	D63oNh1U1J8rfF5Wc+Ldov2x9ZIDpvhCmVNOEPfDA5HNFnRkMilTnaZ2fb7LkxbLFL5x2j5n5xd
	/YE2R49dzpP3u4NpOrqJmGJGbGo0jUDqPfcUCs7e78waYK/o5VoAYrQaHpAPmfp8I7fkVC/mnCK
	aK+V7+0qVQ30eCFvnZmMAeDlPr83UdViONGyJJBLYhZfLOVTYlgs2kFKp/OU7d6p5FPNKm4oKdj
	ZinDfCLNrw6stehPsvL8C6laRS6Aa1bsmTqr9uZUUsKAS7uW8eRPzxAkdKacRyHramZmH+InvE3
	hPQHZuaxixqgRHvN30oZM/0q2Fp+/WgqbQOSwfzsz6yVYt8MCosabY=
X-Received: by 2002:a05:6000:40c9:b0:430:fd0f:2910 with SMTP id ffacd0b85a97d-435b159e2c9mr2341637f8f.26.1769125374768;
        Thu, 22 Jan 2026 15:42:54 -0800 (PST)
Received: from LT-1H84393QVK.localdomain ([79.117.246.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a6fsm1994604f8f.16.2026.01.22.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:42:54 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com,
	marcos.oduardo@gmail.com
Subject: Re: [PATCH v2] lib: sbi: Add KASan implementation for OpenSBI
Date: Fri, 23 Jan 2026 00:42:52 +0100
Message-ID: <20260122234252.190995-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122233104.190844-1-marcos.oduardo@gmail.com>
References: <20260122233104.190844-1-marcos.oduardo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_154256_976444_85777704 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
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

Apologies, I forgot to include the changelog in the patch body.

Changes in v2:
- Implemented a BSD-2 compatible version (based on NetBSD).
- Updated copyright headers.

Regards,
Marcos

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
