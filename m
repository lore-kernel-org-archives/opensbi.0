From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 23 Sep 2021 03:36:06 +0100
Subject: [PATCH 2/2] platform/ae350: Initialize Coherent Manager as early
 as possible
In-Reply-To: <20210923022957.17840-1-ycliang@andestech.com>
References: <20210923022957.17840-1-ycliang@andestech.com>
Message-ID: <3430C8B0-C750-4F0A-A6D3-905450C463EC@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23 Sep 2021, at 03:29, Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
> 
> Coherent Manager will guarantee cache coherency as well as
> the correctness of atomic extension instruction on Andes 45 series on ae350.
> 
> This feature needs to be enabled before the first
> A extension instruction, thus initialize it as early as possible.

Why should this be OpenSBI?s responsibility, rather than in whatever
firmware you have running before OpenSBI that does whatever low-level
platform initialisation is needed like DRAM training (which so far has
been kept out of OpenSBI)? This kind of thing makes it impossible to
use a generic OpenSBI image, unlike other platforms that have moved
towards supporting that. Especially as you explicitly mention U-Boot
here, its SPL is the ideal place for this kind of thing, not in OpenSBI.

Jess


