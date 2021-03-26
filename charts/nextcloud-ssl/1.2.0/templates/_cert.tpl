{{/*
Formats volumeMount for Nextcloud tls keys and trusted certs
*/}}
{{- define "nextcloud.tlsKeysVolumeMount" -}}
{{- if eq (include "nextcloud.certAvailable" .) "true" -}}
- name: cert-secret-volume
  mountPath: "/etc/nextcloud/certs"
- name: trusted-cert-secret-volume
  mountPath: "/etc/nextcloud/certs/CAs"
{{- end }}
{{- end -}}

{{/*
Formats volume for Nextcloud tls keys and trusted certs
*/}}
{{- define "nextcloud.tlsKeysVolume" -}}
{{- if eq (include "nextcloud.certAvailable" .) "true" -}}
- name: cert-secret-volume
  secret:
    secretName: {{ include "nextcloud.secretName" . }}
    items:
    - key: certPublicKey
      path: public.crt
    - key: certPrivateKey
      path: private.key
- name: trusted-cert-secret-volume
  secret:
    secretName: {{ include "nextcloud.secretName" . }}
    items:
    - key: certPublicKey
      path: public.crt
{{- end }}
{{- end -}}
