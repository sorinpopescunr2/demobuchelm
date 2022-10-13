{{/*
Expand the name of the chart.
*/}}
{{- define "demobuc1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "demobuc1.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "demobuc1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "demobuc1.labels" -}}
helm.sh/chart: {{ include "demobuc1.chart" . }}
{{ include "demobuc1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "demobuc1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "demobuc1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "demobuc1.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "demobuc1.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


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