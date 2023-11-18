From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 18 Nov 2023 15:28:26 +0800
Subject: [PATCH v2] lib: utils/fdt: Allow to use reg-names when parsing ACLINT
In-Reply-To: <IA1PR20MB49532E6C3653C0F3EC3EFCDEBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49532E6C3653C0F3EC3EFCDEBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953E854596EE7512087A2D6BBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

Now It seems that kernel prefers to use T-HEAD aclint timer binding for
the ACLINT draft, so this patch may be heavily modified. As a result,
I suggest to temporarily hold this patch to make sure there is no need to
change.

This related kernel mail is on [1], feel free to give your advice. I will
inform you once everything is confirmed.

[1] https://lore.kernel.org/all/IA1PR20MB4953C82499C5D81D2C6A020BBBB6A at IA1PR20MB4953.namprd20.prod.outlook.com/

