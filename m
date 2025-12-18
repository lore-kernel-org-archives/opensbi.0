Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947F5D6ACE4
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUNaxPeHE5JRSSowChBwTdSkYkx7m/lu6lTIQHw+51w=; b=ggcEOtEYROCCeD
	GNXXCMbuMUhTpA2RbKH5npAi5QJHCLO+745T/wkiUVEaZd2nK8WMcIBszxHU0Dreud11UgcjJtf7B
	4tbuaAdM7oD3ZHFZsYv8r8VTJqs4DkgoEl6a0DIrDAIEhjxwnOg6M8blhHpC7ravLqfsg+6U+Mj17
	n3qVq8m2UNi/X4RFFz9TKsinV2m9nRu0inFYhIQn7IifuyqOUggbFDHwfpSlvGIqifdmji4VxaulP
	FXy8zdEZGVxb7/NLVXgfBOZHDM7cQt+Hl+R1mBiOu23l6kzo9GhNedzVJEboxkjz7DlwJQX9sWU6i
	tfrw73BsdBQYlzYBw5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWC05-00000008IwP-2cDB;
	Thu, 18 Dec 2025 11:16:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWC03-00000008Iw2-0uD5
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 11:16:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7ade456b6abso446382b3a.3
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766056610; x=1766661410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HpeuHfroB3pT9jNV++ZTWb9JJQgUMwhWB6ZY9GDwDA=;
        b=UNQbG8Ir8SHaaLTWTIRZZg/VIpY4bCy708ab/CZUOARQRWqULnUMckZ6NxZNWkf8LO
         y47abEBkijul1XJWsnTt2V+Hur0M7kTHvFd0FSzwPtln6FtGECsVOJ65Ro4Ki6eqOSGv
         uzwRSdbFoFazvg1VjdBSc9dCjzf5DX1yik1bagQkPthOriSFp6ZgNYT/VSgzp002t7Jf
         Gw8pBlAFb9C/S1N1rXewNkJCG6tbkYvvfiufocIVq3xMaHdrJLHZAvvEVJnSZDRPJxEC
         Bskq6a6KOGI44wsRhoDS/6iquO+64VGOdRIzwo8dbZ0DP+nBYYnUjzNeLoSG7xg0LJ3p
         iu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056610; x=1766661410;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HpeuHfroB3pT9jNV++ZTWb9JJQgUMwhWB6ZY9GDwDA=;
        b=Ig5kEvxY8S344tTBgXchWh7Kc2hOPrJaKwt2hrWoQmzsXgH2xvVcPAjWeIZTqFo3qf
         yXwUmasJkqjOq41HHj32791/Oll3a+oH2idDOKl6EaPPdBOYRpErG7VuhkaQylI7uMEX
         W784V5QQN0WhGLIQRusZiMA0OOjTwl2q8TvZvCenYSfw8BTmeydlzSS28VoBwlYucsuD
         G6sYtzk+io+bGEDhnRvTvpElYqz8AvBqmv6RIM7WfoC33Sf6Tq1XP6yoq2I3iIG2/HB3
         Pr9wKcGg/IzxldTKgCG+WPk26sFNYu3wkkM4tV4UoRmS/V2oXSJdA+J9SUSqgUzn8j8t
         KhRQ==
X-Gm-Message-State: AOJu0Yyt5DNgOS7wgdHS7O8+XMK1qH0+76oqMtKObNQ2PUFJOTgb61YU
	dY2KTwl1HTh4hgo6o4YsUh+hcT3IwlYzzvxaqO2DK151GIP2J8hrVTkle2lyug==
X-Gm-Gg: AY/fxX4t5CktX+i4bAgZKUeggjRXIwVYuJw3zNEJS2svI9nCBUsL8sejrtlIWQfhz4U
	KjrSSR9517bJwgje3BKuizP00yeLgmME2J35IBqYKh2ErqA0oVdHhwxPCaMeFqk4vZu515JhtJv
	vuJ/3gV9zscFjlCrK2tdy2tCZgSmH8o//kC+ItCKEl83vFHdeoWOYIgTp2g/tWBo/A5qeorBUOV
	2/NIKlXqBFZDpoPAHDNQG0WrssfuMb4XsaaIexWVEGxRrDWoa7jJrHgGVIewMqItxFnzcbxew2a
	Bdq/wLIWzVrA42FyQ6367nmFCUjrdbihjbFDHLJQ1J6KxBP9FpmrNsuLHZkLORhM6m58PbshP6u
	Y715entjzvja20c7Au8UjqHkhClZT/4hKs0mkcQdEZShKNNbaBg7GCzmRotXaJUVJ7iEZrkTifX
	h9uw6lylvmMBYb
X-Google-Smtp-Source: AGHT+IGLuEooNFayJI0lKdzwcV8pqZtr2YGC1l81rN7uhIjKzkF5qu/tVxaXg2zZFFcAPseiBPkLvQ==
X-Received: by 2002:a05:6a20:729d:b0:364:be7:6ffc with SMTP id adf61e73a8af0-369ad8dd0fcmr21620272637.18.1766056609549;
        Thu, 18 Dec 2025 03:16:49 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d1926edfsm22160565ad.87.2025.12.18.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 03:16:48 -0800 (PST)
Message-ID: <a9c1069e-011c-44ed-a848-0a95ccd0a63a@gmail.com>
Date: Thu, 18 Dec 2025 03:14:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Initial ESWIN/EIC7700 and Hifive P550 support
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 gaohan@iscas.ac.cn, samuel@sholland.org, wangxiang@iscas.ac.cn
References: <20251217132959.545197-1-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_031651_261500_24A1B268 
X-CRM114-Status: UNSURE (   2.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Please disregard v5. I just sent out v6 with rv32 build fix. Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
