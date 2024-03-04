From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Mon, 4 Mar 2024 16:46:20 +0000
Subject: [PATCH v3 4/4] lib: tests: Add sbi_console test
In-Reply-To: <20240304-9ea72e3e47d0ba182c7bc325@orel>
References: <20240301160046.267814-1-ivan.orlov0322@gmail.com>
 <20240301160046.267814-5-ivan.orlov0322@gmail.com>
 <20240304-606a8d381108df845a8a365d@orel>
 <f03eae38-bf81-4d3d-be24-b3f80868d81f@gmail.com>
 <20240304-9ea72e3e47d0ba182c7bc325@orel>
Message-ID: <e9b021ee-af97-4033-bc25-e0f20503a03a@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/4/24 16:33, Andrew Jones wrote:
> 
> I'm not sure what's best, since I don't have a good feel for how this test
> framework will evolve. I'd vote for adding a lock now, since it won't
> hurt.
> 

Alright, I'll add a spinlock in V4. Thanks!

-- 
Kind regards,
Ivan Orlov


