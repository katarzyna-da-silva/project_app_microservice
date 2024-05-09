{{- define "webappImage" }}
      - name: webapp
        image: {{ .Values.dockerRepoName | default "richardchesterwood" }}/k8s-fleetman-webapp-angular:release2{{ if .Values.development }}-dev{{ else }}-prod{{ end }}
{{- end }}