---
name: "{{ .File.BaseFileName | humanize | title }}"     # (required) alphanumeric with spaces
github: "{{ .File.BaseFileName }}"                      # (required) github-account-without-spaces
twitter: ""
description: ""
website: ""
date: {{ .Date }}
---
