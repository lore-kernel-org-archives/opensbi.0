From: Cheng Yang <yangcheng.work@foxmail.com>
Date: Wed, 24 Jan 2024 11:42:36 +0800
Subject: [PATCH] lib:firmware: Select preferred boot hart for cold boot.
Message-ID: <tencent_122BA1918E6E2BC87789F2477FD988B06508@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

&amp;gt;add&nbsp;check&nbsp;here<br/>&amp;gt;	if&nbsp;(scratch-&amp;gt;boot_hart&nbsp;!=&nbsp;-1UL&nbsp;&amp;amp;&amp;amp;&nbsp;sbi_platform_cold_boot_allowed(plat,&nbsp;scratch-&amp;gt;boot_hart)<br/>&amp;gt;		sbi_hart_hang();<br/><br/>What&nbsp;this&nbsp;check&nbsp;means&nbsp;is&nbsp;that&nbsp;if&nbsp;the&nbsp;preferred&nbsp;hart&nbsp;does&nbsp;not&nbsp;allow&nbsp;cold&nbsp;boot,&nbsp;will&nbsp;we&nbsp;enter&nbsp;sbi_hart_hang?&nbsp;<br/>So&nbsp;should&nbsp;the&nbsp;conditions&nbsp;for&nbsp;judgment&nbsp;be&nbsp;like&nbsp;if&nbsp;(scratch-&amp;gt;boot_hart&nbsp;!=&nbsp;-1UL&nbsp;&amp;amp;&amp;amp;&nbsp;!sbi_platform_cold_boot_allowed(plat,&nbsp;scratch-&amp;gt;boot_hart))?<br/><br/>&amp;gt;&amp;gt;&nbsp;+	if&nbsp;(sbi_platform_cold_boot_allowed(plat,&nbsp;hartid)&nbsp;&amp;amp;&amp;amp;&nbsp;next_mode_supported)&nbsp;{<br/>&amp;gt;&amp;gt;&nbsp;+		if&nbsp;(scratch-&amp;gt;boot_hart&nbsp;==&nbsp;-1)&nbsp;{<br/>&amp;gt;replace&nbsp;-1&nbsp;with&nbsp;-1UL<br/>&amp;gt;&amp;gt;&nbsp;+			if&nbsp;(atomic_xchg(&amp;amp;coldboot_lottery,&nbsp;1)&nbsp;==&nbsp;0)<br/>&amp;gt;&amp;gt;&nbsp;+				coldboot&nbsp;=&nbsp;true;<br/>&amp;gt;&amp;gt;&nbsp;+		}&nbsp;else&nbsp;{<br/>&amp;gt;&amp;gt;&nbsp;+			if&nbsp;(scratch-&amp;gt;boot_hart&nbsp;==&nbsp;hartid)<br/>&amp;gt;&amp;gt;&nbsp;+				coldboot&nbsp;=&nbsp;true;<br/>&amp;gt;&amp;gt;&nbsp;+		}<br/>&amp;gt;&amp;gt;&nbsp;&nbsp;	}<br/>&amp;gt;&amp;gt;<br/><br/>Thank&nbsp;u.<br/><br/>Regards<br/>Cheng&nbsp;Yang
