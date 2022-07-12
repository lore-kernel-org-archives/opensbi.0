From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 12 Jul 2022 14:07:46 +0100
Subject: [PATCH] platform: move da9063-reset driver to shareable code
In-Reply-To: <20220712090320.564729-1-ben.dooks@sifive.com>
References: <20220712090320.564729-1-ben.dooks@sifive.com>
Message-ID: <70C6A544-CA69-44C4-837A-20450FF9DA86@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2022, at 10:03, Ben Dooks <ben.dooks@sifive.com> wrote:
> 
> The da9063 reset code may be useful for other users, so move this
> out to a new file from the current sifive_fu740.c user. This can
> then be called from the relevant machines.

I sincerely hope not, the da9063 code is a massive hack to work around
an extremely deficient design, one that removes a feature the previous
generation had. Nobody should be looking at it as a feature they can
take advantage of, they should have some form of dedicated reset
hardware in the SoC itself.

Jess


