{{/*
Service labels
*/}}
{{- define "demobuc1.serviceLabels" -}}
io.kompose.service: 
{{- end }}

{{/*
Service selectors
*/}}
{{- define "demobuc1.serviceSelector" -}}
io.kompose.service: 
{{- end }}

{{/*
Ingress labels
*/}}
{{- define "demobuc1.ingressLabels" -}}
app.kubernetes.io/managed-by: Bunnyshell
{{- end }}

{{/*
Custom annotations
*/}}
{{- define "demobuc1.IfNotPresent" -}}
kompose.cmd: kompose convert -o compose --pvc-request-size 1Gi
kompose.image-pull-policy: IfNotPresent
kompose.version: 1.24.0 (HEAD)
{{- end }}
{{- define "demobuc1.Always" -}}
kompose.cmd: kompose convert -o compose --pvc-request-size 1Gi
kompose.image-pull-policy: Always
kompose.version: 1.24.0 (HEAD)
{{- end }}
{{- define "demobuc1.albnginx" -}}
alb.ingress.kubernetes.io/target-type: ip
nginx.ingress.kubernetes.io/use-regex: "true"
{{- end }}