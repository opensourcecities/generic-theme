---
name: "{{ .File.BaseFileName | humanize | title }}"     # (required) alphanumeric with spaces
github: "{{ .File.BaseFileName }}"                      # (required) github-account-without-spaces
description: ""
website: ""
date: {{ .Date }}
---
