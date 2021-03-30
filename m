From: Xiang W <wxjstz@126.com>
Date: Tue, 30 Mar 2021 11:41:45 +0800
Subject: Floating point emulation support policy
In-Reply-To: <EB123894-29D2-4EC4-88FA-D6CB975B0C98@mails.ucas.ac.cn>
References: <EB123894-29D2-4EC4-88FA-D6CB975B0C98@mails.ucas.ac.cn>
Message-ID: <bd2c43acc7cfa3c643fc8c82f4e46339b73f8352.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-03-30?? 10:44 +0800?Xim???
> Hi all,
> 
> My institution wants to run GNU/Linux distributions on a RISC-V core
> without hardware floating point support. We used Berkeley Boot Loader
> (BBL) before which has a built-in support for soft floating point
> emulation. We are swtching to OpenSBI but no such emulations seem to
> exist in OpenSBI for now. I wonder if OpenSBI would be happy to
> accept a port of such functions.
> 
> Regards,
> Guokai Chen
> chenguokai17 at mails.ucas.ac.cn
> 
> 
Good idea! Can be added to simulate illegal instruction exceptions.

Regards,
Xiang W


