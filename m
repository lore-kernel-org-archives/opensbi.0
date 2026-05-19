Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C471CD4F57
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j2gH6f85d2JmE4giaioRjO/62Q0rNLc0CaVibCQOH+0=; b=DAlIQTHffTAO/o
	crtSmq1wD7M1hdDQViMa6zVYPL4KOoVTkJ0oprIsvX+eJ+z7wPaJoyZAFVMdabFu1xPBqfjHtlk9t
	uEIX8CI9KifO+G+iBOZgS80iXCuXbskUld6XuMHuQM3V6WmspnTOYwefFKyYJ3ox1zifnOtm5faxp
	zuv1XnO87FtBcKz/AviYAIlCX417ikuHWxdtr7a/QaKoDEE4sBG44kX4fcTsGYDdo324E6yTgh6Vu
	SYWinrULyYSPXj4EPL2S+ClJi0TBmwdvJ+F9e54zber122zCNV+WTYr9cYDM0BUapwvMjYzw9c7b+
	nEmKGp+k0zjb0KxiljLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGI1-00000000n4o-0ksu;
	Tue, 19 May 2026 08:59:01 +0000
Received: from mail-northeuropeazon11020074.outbound.protection.outlook.com ([52.101.84.74] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGHr-00000000msa-2APY
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 08:58:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjdpgt8dkhDfh4l3P3NfzGH620M2Q6eqeUaGLz8XbPWHv0+vJUdH2SAsm0jOugfGTHR+Vay8UEv0M+jVPWbLO3s7Za9BZ5VyIf3rApgJzVB2l3bDEK44VTRu0wOv9Nl+N56TfXIuVQgYMhihEeoZUuCq84alcyvKk3HWYhKC3dHJevlC52n/Q1MqcNjJzKdFCJYGSnNcp2/0QcJM73WltAnZdbT3LDHvFnTYRklbmPP8Zt+3kzOZJSIzSD7OjKSlyZowynWtIFYSLoVY2jF7uPo83cQWXdjs0nA9FhcrAtjAeyuAuIzhSvJqncFZsFoZCtuoJACMf6CfY1hYSz9VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcRm2frOVDr8BvfxguZjnqKMzogxcifJs5qB1jMC9DU=;
 b=mty91P1U7NHFVloOhu3adgQIux2YZR1RXZsVJUNi6h7eUffLFDam4ClfPhD/DSwts2sQqlYUGxqfDWMAGVeyyYMfnm7Yyul+wQxT6nCRPGoHeskpvWwXFnAADVRj84bcJ47pBd9HWf2Yj7p69JsaXBDXxp82Cp6uufnod445DOFBWGgyBeWIkZo3DHqUmeEl6yT+wsSGeHXsfmP9PTddH3wZI13Bj4rb8seJtFAHj/eTAL8PjQo/I9TMDdewKtatL0RjmZL/pzPKkv4Bv4nVnTHueF9cW+MBJ+PMebNQz61ay5Q7fH3VydqPNGW5lcHlF0WqbC6vFvL2Lyj4+y0Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openchip.com; dmarc=pass action=none header.from=openchip.com;
 dkim=pass header.d=openchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcRm2frOVDr8BvfxguZjnqKMzogxcifJs5qB1jMC9DU=;
 b=u+1ptp7ovQjLZidjCy87jtEyRyds8W2faGUxq13BAxaH6K2wZs5dDQz9Md4T0NyuHJNukbgGcp8uowrMDn69V5J2W9LhjaM/UzHWsLKDVQH/n0C50TQKEkEdqXmMcRCwo6p27poPxbCuQveC084jDZxwF4APiMeVcEhrU0A4cVTZthDhIJunDGGjYAbk+VmekmBfhESN3p0sOb21YyhfR8x301BauyHTQOCYiWmSJMdrKMSUOIMofAJcQDAHJn5HbhTlAU3HZveW35OFcrRNZ9lEzFnXFssvbio2RE9trriSqlS884J70wreZYA7ZucXFi45yqMKRqUnyKHlo0E/eQ==
Received: from VI0P192MB3062.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2c8::16)
 by PAWP192MB2410.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 08:58:45 +0000
Received: from VI0P192MB3062.EURP192.PROD.OUTLOOK.COM
 ([fe80::ded8:262c:914b:dc9b]) by VI0P192MB3062.EURP192.PROD.OUTLOOK.COM
 ([fe80::ded8:262c:914b:dc9b%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 08:58:45 +0000
From: Oriol Catalan | OPENCHIP <oriol.catalan@openchip.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: lib: sbi: Make per-HART stack size configurable via Kconfig
Thread-Topic: lib: sbi: Make per-HART stack size configurable via Kconfig
Thread-Index: AQHc522eurRP/sXRKkSEsPQ5Avm1cg==
Date: Tue, 19 May 2026 08:58:45 +0000
Message-ID: <VI0P192MB3062735A6194BB6DA72083499E002@VI0P192MB3062.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P192MB3062:EE_|PAWP192MB2410:EE_
x-ms-office365-filtering-correlation-id: 1d047ecc-782a-4a33-fdaf-08deb584d594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|11063799006|18002099003|56012099003;
x-microsoft-antispam-message-info: BMa8okoosSxjyU2gv0/fvq09D5JFSxvtbEAfZLCxREH6BSzfMqp0fn0KjBZwWI6gm5qTEGCflOdezfxw6XhZePCjPnbcmoOA2ny8vfFn+S7+ORKmpT09SvrE8VM5vbO25OsKBSYgWeDBtyATZpDUZ+WPumiazg+jMdLyzh9+iEIJ9xAdxKIplzKBEN1jk3LF2vELVkuEYSRks7HFUkRcl+Te4HTesvsZ628fxi2Q/uPNMipA//lt/EdyGGXDTKnDRmkZUny0AVrkBPXRd1Xp0SUJMdLTOeTTSr1t/ecAOQAQxuXwO5MK2rlUGoQ3y5qpuh6Q8JaH5+ko6yfc5xjJ5MKnnIwkrjk9WopeQ+1y4g/lmeyxklUJQetxKDHEIw77JFMY3zcRRyyqFZPth2qC3YBIFe51Z8Rh+q4yPxCkoifUqhokEVA1Cr1m0CEhQr80bnyO9MXp/89rCoWCHjYjVDTELy3EpF5S1gDzj94q1hNKUxZQSLlYEr80ru0Bxi4vH1xdRk2fGD7oOwBMuDc7QVApTWbUgeFzhJyiCGze0g7JveJzm0QIIWhvx1dtEuq+pImTTM8hnM26tYL52aJtg6cF7+84r6lXtcld68s5iMACymMkD4eNkVyyNMMZbG0bnv1OK5BQGuHPcqUMSkiNeUZcO/7Ty2C2ffz9azmNolQOjGZ6/yxafBpY29x5ONTRcxKizVYqfNSK6JCA6TcGGcldJiS5udT0/sq4l0Yd47zpZITkVoZGISaCPwcQg5tl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P192MB3062.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?W/ul1Z05wLjkxtQUtMoyem0tCsVq8j3Cf20BZMc7x1BzEg9+1duzl+zWrl?=
 =?iso-8859-1?Q?RwjmrapfaorwX6W1ss5qjEwnr7KsVXKqcbTPivpMBEp4uQ8F0rlq6Q26co?=
 =?iso-8859-1?Q?a42DJFEM/tdDNqbD5TypFehEVOi6iiKAznc0L1E9U9a2PvImI1IRIt7iLn?=
 =?iso-8859-1?Q?QJxPEqtT5HFAYTaxgfTEnaRlGmivq44xVL2knKg12oKlVakddbXj4Z0kDD?=
 =?iso-8859-1?Q?IZLSCJ/F5Gt3LQtn5NZUEoEilaU6TywGrL/I8C0464WhXOiHaTAZ1JT+Jj?=
 =?iso-8859-1?Q?3dgPZ02mE/b25wTQusxyl0aghpWR6QxctYRf5W/WcWij9xFWIYqo6Y7Wbx?=
 =?iso-8859-1?Q?PD1y328H/HxK/iaD7aGkr2fpCy6PBbZAukcwrKIzFrSTjilo+PS5muHUfd?=
 =?iso-8859-1?Q?SHCMAjfLdxw9DX3SgCw+rvFVPQqMCC8bvuemIA7MBx0TdY/Hqtweoq5xaW?=
 =?iso-8859-1?Q?Xb0+Lo+ZN8absS6zFxFYN0qagIMp3MvU+ggRv7YJZJTsOVshwOzsAvWPdE?=
 =?iso-8859-1?Q?6GzHIWQPTcIhkxdjbnB21K+ROFAPmn99gzlUmBpzou4omXLLgzfemiAVqc?=
 =?iso-8859-1?Q?NUKW4N46SQ5E10AKetxa9conzmPDfzEK29MAxzWasNgYSu+lscx3IctEt5?=
 =?iso-8859-1?Q?YT+88LtHjKxBvJnxVPimW5mGAg9XHNDppLpgmCpN5p7sTO7EAb66D5TPy7?=
 =?iso-8859-1?Q?+pY0dpHiFd5nNFFlWTfY8DDjPa6d4ZDslUVux0JF7cihk5tTXPjjiEqfU+?=
 =?iso-8859-1?Q?AYcyDUJs7eKnQy19R1UNXynK0QhhDh4MTBncFU48+Wbo15Cc389eOZpMdR?=
 =?iso-8859-1?Q?ENBh67X9+0VOH+SygRWhvPJ1yho5SoxLr1ttSAeLCXB9XsCtoTSc/Woipo?=
 =?iso-8859-1?Q?1hxry3Q3gASgRIT0sfQwN0SOLkP8BQ0UGGZMbvbKfu3wlE9trsCaVgDpXM?=
 =?iso-8859-1?Q?F6pxMEaDM8owyY6J6f9MchOrNfbE/2TOG2zjf5cBsV9JyNfEQD5UhEjwON?=
 =?iso-8859-1?Q?kJvWrxgquqitnkWHybyZ4VXaszXhc6bUnqHLXThQHBEG0FJ7ZIRQ2gcKvj?=
 =?iso-8859-1?Q?pJ+2LD4y45k4UxDVdH4W6/fiWzr1rTJ5T+hzlZzDh5ZeHM2nH8b7/Cp8qa?=
 =?iso-8859-1?Q?faaYqb8gWfYLokpEOLRhCk323Dt+JXNzFZR3jljJoz1OoH+Fyml89gIuVU?=
 =?iso-8859-1?Q?XQP4g3NUYrNvxo3p+mZ96AzVqIi0wwEBBUxyR3NiKZLD9jou9LHnjBwajD?=
 =?iso-8859-1?Q?Li9ysJQdb9SoBULfK+OkPWhp2n/SCChiLzEIHyv0Wb5M+XuuuHip2QkgZ0?=
 =?iso-8859-1?Q?9SrzFj0Gg/UBYJalF6JQchnQP5atbFwaAmhpuJJPIYwdo6P4r+AX3vryIl?=
 =?iso-8859-1?Q?TwusHAD35OqdR/WtcU9JiwrJEs8C7/3xvYESVroHyn0ykUUZvMOYk9+OXe?=
 =?iso-8859-1?Q?guCX5SG64lIbxY71t8ZT1z5O83CoxeQyki7R7G6OmonsWkpMeE23yxYDFQ?=
 =?iso-8859-1?Q?nW9AkAjQiGrwqzWAHGDJLQd5WdyVobRdnINF20FwAJRb0B/PArEWCdrw9I?=
 =?iso-8859-1?Q?k1uHbzYTyTlSjNhI7OLbi1HxgS4eGQd0im9qLC5ydRT+3dObyZcrsb2f8j?=
 =?iso-8859-1?Q?3r3x1QLTckx9RMiZGrL7QXodDT/XTV4vPQGZdh71Yp2+7nH3aKXcPLetrI?=
 =?iso-8859-1?Q?WVCc5UBaf2Z6HnauDtUVr2DT9ASsLGoU2AVyRO7TVYu8ICAJqMNDle8d6F?=
 =?iso-8859-1?Q?Dhjj8iu6oWsjNAJPKm2SKKOCtq/N7kHQn3BKXiake0REEZrF5LlH1QoFXb?=
 =?iso-8859-1?Q?wrw22LR2Wg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P192MB3062.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d047ecc-782a-4a33-fdaf-08deb584d594
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 08:58:45.6291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfdd4aff-e2c9-4e1a-8642-7f6cc6bbbe6d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWeRXHtU4Y3SRHrvN33js3hgg7c7M39v/3eO5ocpostpD7expV3F+UekZv+Pw7Bqm8Zo/s598paB7mdXYwF9ZTUmCtkjlMGODbleT0MDozc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_015851_575410_D4FC00DC 
X-CRM114-Status: UNSURE (   4.82  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

lib: sbi: Make per-HART stack size configurable via Kconfig

The per-HART stack size for exception/interrupt handling is currently
hardcoded to 8192 bytes in SBI_PLATFORM_DEFAULT_HART_STACK_SIZE. This
may not be sufficient for platforms with deeper call stacks (e.g., those
enabling additional SBI extensions) or may be wasteful for minimal
platforms.

Introduce a HART_STACK_SIZE Kconfig option in lib/sbi/Kconfig with a
valid range of 8192 to 1048576 bytes and a default of 8192 bytes to
preserve existing behavior. The SBI_PLATFORM_DEFAULT_HART_STACK_SIZE
macro now resolves to CONFIG_HART_STACK_SIZE, allowing all platforms
to benefit from a single configuration knob without any source changes.

Signed-off-by: Oriol Catalan <oriol.catalan@openchip.com>

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index fe382b56..7ea9b961 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -160,7 +160,7 @@ struct sbi_platform_operations {
 };

 /** Platform default per-HART stack size for exception/interrupt handling =
*/
-#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE   8192
+#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE   CONFIG_HART_STACK_SIZE

 /** Platform default heap size */
 #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)     \
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..2f6fa3a4 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -2,6 +2,11 @@

 menu "Generic SBI Support"

+config HART_STACK_SIZE
+       int "Per-HART stack size (bytes)"
+       range 8192 1048576
+       default 8192
+
 config CONSOLE_EARLY_BUFFER_SIZE
        int "Early console buffer size (bytes)"
        default 256


The content, data, and any attached documents to this email are addressed e=
xclusively to the addressee and are confidential and/or may be subject to a=
 non-disclosure agreement. Any use, forwarding, disclosure, and/or copying,=
 in whole or in part, without authorization is prohibited. If you have rece=
ived this email in error, we apologize and, please notify the sender or Ope=
nchip immediately, and delete it from your system.

El contenido, los datos y cualquier documento adjunto a este correo electr=
=F3nico est=E1n dirigidos exclusivamente al destinatario y son confidencial=
es y/o pueden estar sujetas a un acuerdo de no revelaci=F3n. Est=E1 prohibi=
do cualquier uso, reenv=EDo, divulgaci=F3n o copia, total o parcial, sin au=
torizaci=F3n. Si has recibido este correo por error, te pedimos disculpas y=
 agradecemos que lo notifiques de inmediato al remitente o a Openchip, y lo=
 elimines de tu sistema.

El contingut, les dades i qualsevol document adjunt a aquest correu electr=
=F2nic estan dirigits exclusivament al destinatari i s=F3n confidencials i/=
o poden estar subjectes a un acord de no revelaci=F3. Est=E0 prohibit quals=
evol =FAs, reenviament, divulgaci=F3 o c=F2pia, total o parcial, sense auto=
ritzaci=F3. Si has rebut aquest correu per error, et demanem disculpes i ag=
ra=EFm que ho notifiquis d'immediat al remitent o a Openchip, i l'eliminis =
del teu sistema

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
