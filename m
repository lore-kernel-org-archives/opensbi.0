From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 21 Nov 2021 16:45:30 +0000
Subject: [PATCH] reproducible builds: strip embedded file paths
In-Reply-To: <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
References: <874k89kl8o.fsf@ponder>
 <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
Message-ID: <DF6C5E27-02BF-49BB-B677-AAF7B058C289@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21 Nov 2021, at 16:40, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-11-18???? 17:05 -0800?Vagrant Cascadian???
>> 
>> Unfortunately, the use of __FILE__ can embed the absolute build path
>> in
>> the resulting binary, resulting in different binaries depending on
>> which
>> path the build was performed in.
> 
> Under what scenarios will absolute paths be embed.

As Vagrant said:

"A recent commit 12753d22563f7d2d01f2c6644c7b66b06eb5c90f introduced a
use of __FILE__ to display the file in some debugging output.?

The lazy BUG macro, added in that commit, uses __FILE__.

Jess


