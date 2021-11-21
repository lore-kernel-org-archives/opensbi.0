From: Xiang W <wxjstz@126.com>
Date: Mon, 22 Nov 2021 00:40:00 +0800
Subject: [PATCH] reproducible builds: strip embedded file paths
In-Reply-To: <874k89kl8o.fsf@ponder>
References: <874k89kl8o.fsf@ponder>
Message-ID: <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-11-18???? 17:05 -0800?Vagrant Cascadian???
> 
> Unfortunately, the use of __FILE__ can embed the absolute build path
> in
> the resulting binary, resulting in different binaries depending on
> which
> path the build was performed in.

Under what scenarios will absolute paths be embed.

Regards,
Xiang W



