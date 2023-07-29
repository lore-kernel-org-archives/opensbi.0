From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 29 Jul 2023 10:19:31 +0800
Subject: [PATCH] gitignore: add VSCode workspace dir
In-Reply-To: <F386D298-4E1D-4DC5-A798-D5F0D36E8CDC@jrtc27.com>
References: <F386D298-4E1D-4DC5-A798-D5F0D36E8CDC@jrtc27.com>
Message-ID: <IA1PR20MB4953B56ECBFD046D33CB8E3DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I agree with you that projects should be responsible for their own build
outputs. I know you want to keep the project clean, but it is not good
if the developers upload files associated with the editor by mistake.

Maybe we just ignore any file begin with dot and allow some exception (like
.clang-format and .gitignore itself). This way is already used in linux and
it works well.
AFAIK, the *.swp also begin with a dot, so this can also solve this issue.

> Put .vscode in your global gitignore file then? The *.swp shouldn?t
> really be here either. Otherwise every project?s gitignore becomes a
> mess trying to ignore every editor. Projects should be responsible for
> their own build outputs, and users should be responsible for whatever
> cruft their system?s tools leave around.
>
> So, NAK from me (and a request for someone to remove the *.swp).
>
> Jess

