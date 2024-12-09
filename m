From: Richard Hughes <hughsient@gmail.com>
Date: Mon,  9 Dec 2024 12:05:08 +0000
Subject: [PATCH 0/1] Add a SBOM template in CycloneDX format
Message-ID: <20241209120653.996455-1-richard@hughsie.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

My name is Richard Hughes and I'm a developer at Red Hat. I'm the maintainer of fwupd and LVFS, and am trying to improve software supply chain security by encouraging OEMs, ODMs and IBVs to ship Software Bill of Materials with each firmware binary blob (SBOMs).

I'm working alongside lots of other companies proactively trying to do the right thing. The reason I've opened this pull request is because your project is either used in the build process of a firmware we care about (e.g. EDK II, or coreboot) or is built into the firmware binary itself. Although my personal focus is on firmware, the SBOM file is in CycloneDX format (one of the most popular industry standards) which makes it also useful when building containers or OS images too.

I would like to contribute this template SBOM file into your project that gets included into source control with substituted values that get populated automatically. I'm not super familiar with OpenSBI, and so I've done my best populating the project values -- but please point out any that are incorrect and I'll fix them up. I've also put the sbom.cdx.json file in what I feel is the right place, but please say if you want me to put it somewhere different or name it a different thing; the directory and sbom prefix are unimportant.

I couldn?t find any existing CVEs that reference your project, so I?ve created a CPE reference that seems plausible. Please let me know if you know of a better CPE to use.

The various firmware build tools will take these incomplete SBOM files and then build them into a complete composite SBOM to represent the firmware. Having an upstream reference to what the PURL and CPE values should be means we have something we can trust; I could quite easily spin up a web-service that we say "what CPE do we use for X" -> cpe:2.3:a:Y:Z:::::::: but we don't actually know if that's still true, up to date, or what the supplier actually wants them to be. Putting the template upstream means we can trust the values we find in the checked out code during the build process.

I've written a bit more about this proposal here https://blogs.gnome.org/hughsie/2024/11/14/firmware-sboms-for-open-source-projects/ and there's also lot more information about firmware SBOMs here: https://lvfs.readthedocs.io/en/latest/sbom.html ? many thanks for your time.

Richard Hughes (1):
  Add a SBOM template in CycloneDX format

 docs/sbom.cdx.json | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 docs/sbom.cdx.json

-- 
2.47.1


