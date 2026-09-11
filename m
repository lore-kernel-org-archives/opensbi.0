Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F34C88E41
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 05:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyUs4ObBIG3xY3Ats0kseC44SBqrlvmLYYbWqtzRKD4=; b=09Glj4J7230Tmi
	0TSV7A/dDD+Xzn7w0qz18psEItssUJnrqrk2x4nxdw8PqankAw6UrUkoF6kvHxEl+FBiNoiXIXDeI
	poIhZN9mc9mlJxwhzcx/Krf2rZCe8MXnAkwF1axSh7cqfVXCUJWlgzYWbBN9ykD0Nb9gKkXSIIHt1
	XLgV/7wg+rJB1PZTF5wu6srfDO5+DogKKpg+c30I0zHix8EuNhggr4HmzhZKPMY51Qf/1TmSmdsI6
	UjBmT9EwiH4N7DyBfM0n35iYR7d3EnIhEPIjA5jnZkGGb/8p0iddwLCTDUcP3+2cJiX3ALUcSPzPo
	BQaB+9+LnVZTLLbwW/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tsB-0000000FsjD-3wg3;
	Fri, 11 Sep 2026 05:32:27 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ts9-0000000Fsit-2fTX
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 05:32:26 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c83be8db39so467749e0c.3
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 22:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789104744; cv=none;
        d=google.com; s=arc-20260327;
        b=oJOslZAsYmzTxHekqqQ69FmFqVUVzM5L6/2v8iBbVH7pMgDynaj9pHErmW9mut6EP7
         JLNzzb4bqyzh8veYO/tyPQlRMe0ydkP+Jdp5kz7e1yZdribkur/OxPjWWvEzw5Q9xPdg
         lfU4clrZuoZcm8mr1Uujc33rXC6MQ+jCXbiSLczQqbEPKyrVQeP1Z44AFSZIuLAyWPJm
         SSURFDrATEiiDAY4GgGRqw7YKhvBRrcLIecKwFuFC40j1tntzFJzAhfaSanmDTZt7N9h
         wmznvoqjb/mBACbj9AEQ2suRVOODghYjF+4O3akCiqBUBn/baBZzdTdblJ0inr+/Me+X
         dqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJRmeifp32O7Nqoxhk+Cohumuoo64a9UdMJrcy+NuM8=;
        fh=79g51uf4LaQDlaG1tfQ9epn9xyrlRspleSRHM8SHN9I=;
        b=nxTiyW21S/0zcKADUVla0e32iRaZUBi3t8cCVVoDqGrbqKzsKCm9gE5TZO4m96r8eq
         D0zlBOXre4pxK94FaYcuHiSPsvQJVtY8BhFccPSteQ6FWlejhV4m6lrJxVadu7VIQ6MK
         agtYVG4EF5lnhto1MpSflV2+ssiJ3yO6yx6RMOLsa/YUsvAobp7W0hCRMpg2wg0iS6Ev
         obNLsePvcuaEFgWDxJ7KlNpLMudEi95RUn343C9KTyQhhTR4Bkah8g/Qaou9wGWqMO8e
         51vZLJkDLgFGiSNA0D4TyFhqIkXExOH6YxhJHpm7DLNfQyDRAW9GV3xiVCgouTzgmK21
         f64A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789104744; x=1789709544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJRmeifp32O7Nqoxhk+Cohumuoo64a9UdMJrcy+NuM8=;
        b=hWWudHJHaubbqBhaVk2sZWcv7bb0cJpq6P78EU1rDyj9WiEnaZJwehzvVYudOkWp4e
         M1X41a3KUdekyhBpYTznJqGfStSc+5I0zUkFI0UcVvXADjLq22kfHYWFiPGGS3Pp2MWH
         rJIG1M3VUFV8D2VwrMABPROTGnTxBMw+XyG7V/am0xu3sxCq96dUkEkWoI83blyLTsnr
         MEKmnOdbdWSx3Typ3Xm0ATJtoUsK2jAutn1Nt/W0fSgQYzQCpPniksHfRskwg7FwDXcP
         wG6e7sQxc3DEiowyXIeJNJxhubhyL4P7Ch58vqKv3XeVNDDOO6oXlLwXxd63jss1JG+1
         Mr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104744; x=1789709544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJRmeifp32O7Nqoxhk+Cohumuoo64a9UdMJrcy+NuM8=;
        b=tRi3uDbYKqcpnb4etsWQzOr15HU0KgSbLF0qSYYCcOUFdttjF2DEEHKtASgb7aQf9f
         xrJ4Ap81p4zxIlZW+hXH6GeyoTEpM07BWM7AgyXVOsTijdRiDAqQTzbMFobevpuSFWUg
         TVmt8JXnXlzXmYoaMtasYxk1Mz8kYaP+2rUggrwlQU9LtFoRnqknvYAShsAO+BQMQ58M
         s9pvp8fCWsfGS8EewIAckWB3M/wL/OGa8A1GSz01jKq2AT5rGxpWK+du5zpqFkCnjSbI
         aieDCTi9ue8HePF+F2hXoOhyb7js96nMcURxm4pL9Nxc+sNYhQMIWx9oUGZaxWC6Kv6/
         7MUw==
X-Gm-Message-State: AFuF++lM1CNNAOjwRBx2t6WrurvfAxpGKIJBd8/QQGgHxj5d4QuDtfiB
	6UcgwlisEnb+faM1voJoOvjrEl22yalkQo7xjicJqLaDkTKem7YURywdq3t45MXGOki+BtX46uS
	YAIieVt4DJL52U7a/JegkyOglnRs8Yu3Mg4AdMrgG1g==
X-Gm-Gg: AYBFou0av3G1q2u/lKXLlY0Ehf/jN7O04yyvYSz37YthM3Jg2RjnWpMo42gtoprszE7
	cdpljFkRHyNdQyAdnLOZLfJuySHUjfAkYIQ61Lg+eO2P1hUTzMr4PI1tPf/Vuxr+t1lL9AQqTRR
	JSDxUqpETPxUATiDAHJdoo6DQFZ9KiyB5IL/IaD4ydmRJ7dyow+BuRBxBupUO0Cn1ieMJwxM5HC
	jdczMskgFuCef0KeOErt56EWFDogIkQ18vs+HMW89XixKzHWuMoVlVhkWyhZZj8yBJSTzXy6lD0
	rTzVtqgmkFmG6JNkT7Pc197nHJDwBaAhVO8ogvG0RDflDgYh3ZliFPD2wQ==
X-Received: by 2002:a05:6122:4894:b0:5c8:c5f:e8fa with SMTP id
 71dfb90a1353d-5c846256c9emr1951199e0c.4.1789104743735; Thu, 10 Sep 2026
 22:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com> <20260909193431.5544-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260909193431.5544-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Fri, 11 Sep 2026 13:32:12 +0800
X-Gm-Features: AcwNN1VQhpUmDzaL7gfl0kvCZ3ULYPP7g62GZKU8TSOUONgomTfR595AqNH2E2I
Message-ID: <CACpYXwBhoa9uogkNc6GDOrDTStqiiR-JDLZ3kD1PtyFZ610vDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix stale trap_context/prev_context linking
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_223225_733878_B88DD9A5 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMzozNOKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IExHVE0sIGJ1dCBwbGVhc2UgcmVzZW5kIHdp
dGggc29tZSBjaGFuZ2VzIGluIHRoZSBkZXNjcmlwdGlvbnMuCj4KPiBQYXRjaCAxLzI6IGl0IGNs
ZWFycyB0cmFwX2NvbnRleHQgYW5kIG5vdCB0bXAwIGFuZCB0bXAxLCBzbyB0aGUKPiBfc2NyYXRj
aF9pbml0IG1pcnJvcmluZyBtZW50aW9uZWQgaXMgbm90IHByZWNpc2UuIEFsc28gaXQgYXZvaWRz
IGEKPiBicm9rZW4gdHJhcCBkdW1wIGFuZCBhIHNiaV9tZW1jcHkgdmlhIHNjcmF0Y2gtPnRyYXBf
Y29udGV4dCB3aXRoIG5vCj4gTlVMTCBjaGVjaywgd2hpY2ggY29ycnVwdHMgbWVtb3J5IHNpbGVu
dGx5LgoKUmVnYXJkaW5nIHRoZSBzYmlfbWVtY3B5KCkvTlVMTC1jaGVjayBpc3N1ZSwgSSBncmVw
cGVkIHRoZSBjdXJyZW50IHRyZWUsCmJ1dCBzYmlfZG9tYWluX2NvbnRleHRfZW50ZXIvZXhpdCgp
IGhhdmUgbm8gY2FsbGVycyBoZXJlLCBzbyBJIGNvdWxkbuKAmXQKY29ubmVjdCBpdCB0byBhIGNv
bmNyZXRlIGJ1ZyBpbiB0aGlzIHNlcmllcy4gRGlkIHlvdSBoYXZlIGEgc3BlY2lmaWMgY2FsbGVy
Cm9yIHBhdGggaW4gbWluZD8gSWYgc28sIEkgY2FuIGFkanVzdCBpdCBhY2NvcmRpbmdseS4KCk90
aGVyIHRoYW4gdGhpcyBwb2ludCwgZXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QuIEnigJlsbCBp
bmNsdWRlIHRoZW0gaW4gdjIuCgpUaGFua3MsCk5pYQoKPiBBZGQgYSBGaXhlcyB0YWcsIEkgdGhp
bmsgdGhpcyBpcyB3aGF0IGdldHMgZml4ZWQgd2l0aCB0aGlzCj4gcGF0Y2g6Cj4KPiAgICAgICBG
aXhlczogNjBmZmMxNTRjODRkICgiaW5jbHVkZTogc2JpOiBBZGQgdHJhcF9jb250ZXh0IHBvaW50
ZXIgaW4gc3RydWN0IHNiaV9zY3JhdGNoIikKPgo+IFJldmlld2VkLWJ5OiBFdmdlbnkgVm9ldm9k
aW4gPGV2dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4KPgo+ICAgVGhhbmtzLAo+ICAgRXZnZW55Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
