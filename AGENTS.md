# HDMessageDlg — Regras do projeto e backlog de revisão

## REGRA PRINCIPAL — autorização prévia

> **NÃO EDITAR O CÓDIGO SEM AUTORIZAÇÃO PRÉVIA DO USUÁRIO.**
>
> Antes de alterar qualquer arquivo de código-fonte (`.pas`, `.fmx`, `.dpk`, `.dproj`, `README`, `.json`, etc.):
> 1. Apresentar o que será alterado e por quê (plano + diff resumido).
> 2. Aguardar aprovação explícita.
> 3. Só então aplicar a alteração.
>
> Análise, leitura, compilação em cópia temporária e diagnóstico são permitidos sem autorização.
> Correções devem ser feitas **um item por vez**, sem misturar assuntos.

## Contexto da revisão

- Revisão feita em 05/11/2026.
- Pacote e sample compilados com `dcc32` do Delphi 12 (23.0): **0 warnings / 0 hints**.
- Testes de limpeza feitos em cópia temporária (o repositório não foi alterado).
- Remoção do `TImage` morto + `StyleBook` não utilizado reduz o `.fmx` de **1372,3 KB para 9,3 KB** e continua compilando.

## Legenda

- **P** = prioridade: `P1` crítica, `P2` alta, `P3` média, `P4` baixa/opcional.
- **Status**: `Pendente`, `Em andamento`, `Feito`, `Descartado`.
- Referências no formato `arquivo:linha` (linhas do estado atual do repositório).

## Backlog — bugs

| ID | P | Status | Item | Local |
|----|---|--------|------|-------|
| B01 | P1 | Feito | Corpo da mensagem usa a cor de "question" em vez de `FMXLabelBodyMessage` | `src/FMX/HDMessageDlg.View.FMX.pas:108` |
| B02 | P1 | Feito | Barra de título usa a cor do ícone em vez de `FMXColorTop` (regressão do commit `7a9bfbb`); contraste ruim para Attention/Like/Message | `src/FMX/HDMessageDlg.View.FMX.pas:133` |
| B03 | P1 | Feito | `ColorSvgIcon` troca as cores de `TiMessage` e `TiQuestion` | `src/HDMessageDlg.IconsSVG.pas:89-90` |
| B04 | P1 | Feito | `StyleLookup = 'btnConfirmacaoCustom'` não existe no StyleBook; botões caem no estilo padrão. **Corrigido pelo usuário: estilo presente nos 3 recursos (Default, Win10, Win11).** | `src/FMX/HDMessageDlg.View.FMX.fmx:15533,15583` |
| B05 | P2 | Feito | `BtnLike` está aninhado dentro de `Button3`; `Button3` sem handler e com texto `Button1` | `Samples/Samples.Principal.fmx`, `Samples/Samples.Principal.pas` |
| B06 | P2 | Feito | Encoding misturado: padronizado para UTF-8 com BOM nos `.pas` com acentos (`Consts.pas`, `Samples.Principal.pas`, `HDMessageDlg.pas`); `README.MD` já era UTF-8 | `src/HDMessageDlg.Consts.pas`, `Samples/Samples.Principal.pas`, `src/HDMessageDlg.pas` |
| B07 | P2 | Feito | README usa enums inexistentes (`iAlert`, `tOK`, ...) e blocos com `begin` duplicado / `var` após `begin` | `README.MD` |
| B08 | P2 | Feito | `FormKeyDown` não zera a tecla; `TCustomButton` também trata `vkReturn` → ação pode executar duas vezes | `src/FMX/HDMessageDlg.View.FMX.pas:113-123` |
| B09 | P2 | Feito | Sem `MsgIcon`, o diálogo fica sem ícone e com cores transparentes (sem defaults) | `src/HDMessageDlg.pas` |
| B10 | P4 | Descartado | Contraste dos ícones no fundo é baixo: Attention 1.49, Like/Message 2.02, Error 3.64 (adiado para v2.0) | `src/HDMessageDlg.IconsSVG.pas:53-65` |

## Backlog — consistência e limpeza

| ID | P | Status | Item | Local |
|----|---|--------|------|-------|
| C01 | P2 | Feito | `MsgIcon` tem 5 branches idênticos; reduzir para 3 linhas | `src/HDMessageDlg.pas:96-102` |
| C02 | P3 | Feito | Construtor vazio e destrutor que só chama `inherited` | `src/HDMessageDlg.pas` (removidos) |
| C03 | P2 | Feito | `Data.DB` e `dbrtl` não são usados (units + dpk + dproj) | `src/HDMessageDlg.pas`, `src/HDMessageDlg.IconsSVG.pas`, `HDMessageDlg.dpk`, `HDMessageDlg.dproj` |
| C04 | P2 | Feito | `Winapi.Windows` só para `VK_RETURN`/`VK_ESCAPE`; trocar por `vkReturn`/`vkEscape` de `System.UITypes` e liberar cross-platform | `src/FMX/HDMessageDlg.View.FMX.pas` |
| C05 | P3 | Feito | `MsgResponse` exposto com `write`; seção `public` vazia antes de `published` | `src/FMX/HDMessageDlg.View.FMX.pas` |
| C06 | P4 | Feito | `btnNo.Text` atribuído em `FormShow` e de novo em `TypeQuestion` | `src/FMX/HDMessageDlg.View.FMX.pas` |
| C07 | P3 | Feito | `DisplayMessage` e `DisplayQuestion` repetem os mesmos 10 `assigns` | `src/HDMessageDlg.pas` |
| C08 | P4 | Feito | Nomenclatura mista `SetYes`/`SetNo`/`TypeOk`/`TypeQuestion` (mantida — v2.0); `WrapMode` duplicado no `.fmx` e no código (removido do código) | `src/FMX/HDMessageDlg.View.FMX.pas` |
| C09 | P3 | Feito | Constantes VCL não usadas (removidas), `FMXColorTop` em uso (B02), linha em branco antes de `implementation` (encoding cp1252 mantido — ver B06) | `src/HDMessageDlg.Consts.pas` |
| C10 | P4 | Descartado | Typos: `Backuground`, `imgMenssage`, `RecBackGround` vs `Backuground` (renomeação breaking — v2.0) | vários arquivos |
| C11 | P4 | Descartado | Nomes genéricos `TIcon`/`TType` e `iHDMessageDlg` minúsculo (breaking change — v2.0) | `src/HDMessageDlg.Interfaces.pas:6-9` |
| C12 | P4 | Descartado | Formatação: alinhamento de colunas, indentação de 3 espaços nos `try`, ordem dos `uses` (cosmético — v2.0) | `View.FMX.pas:27,29,45`; `HDMessageDlg.pas:57-63,76-82`; `IconsSVG.pas:74` |
| C13 | P4 | Feito | `Icon()` sem `Result` padrão; adicionado `else Result := ''` para novos enums | `src/HDMessageDlg.IconsSVG.pas:92-103` |

## Backlog — repositório e empacotamento

| ID | P | Status | Item | Local |
|----|---|--------|------|-------|
| R01 | P1 | Feito | `.fmx` de 1,37 MB por `imgMenssage` morto com 6 PNGs embutidos e caminhos absolutos `D:\Recursos Programacao\...` | `src/FMX/HDMessageDlg.View.FMX.fmx`, `src/FMX/HDMessageDlg.View.FMX.pas` |
| R02 | P3 | Feito | `src/assets/*.png` sem uso (só referenciados pelos bitmaps embutidos do R01) | `src/assets/` (removida) |
| R03 | P2 | Descartado | `StyleBook` de 25 KB com estilos de outro projeto — **mantido** porque B04 depende dele (`btnConfirmacaoCustom`); limpeza dos estilos não usados adiada para v2.0 | `src/FMX/HDMessageDlg.View.FMX.fmx` |
| R04 | P2 | Feito | `Samples.dproj` com ~1,9 KB de `DCC_UsePackage` de terceiros (FastReport, Indy, RESTDW, RTinfor, Skia...) e sem `DCC_UnitSearchPath` | `Samples/Samples.dproj` |
| R05 | P2 | Feito | `HDMessageDlg.dsv` versionado com caminhos absolutos; adicionar `*.dsv` ao `.gitignore` | `.gitignore`, `HDMessageDlg.dsv` (desrastreado) |
| R06 | P4 | Feito | `LICENSE` e `LICENSE.txt` idênticos; manter apenas um | `LICENSE` |
| R07 | P3 | Feito | Versões divergentes: `.dproj` em `1.0.0.0`, `boss.json` em `1.2.3` | `HDMessageDlg.dproj` (1.2.3.0), `boss.json` |
| R08 | P3 | Descartado | Pacote só com Win32/Win64x no `.dproj`; código já é cross-platform (C04). Avaliação de outras plataformas adiada. | `HDMessageDlg.dproj` |
| R09 | P4 | Feito | README com link comentado para `dliocode/datavalidator` (resquício de template) | `README.MD` |

## Detalhes e correções propostas (itens P1/P2)

### B01 — Cor do corpo
```pascal
// src/FMX/HDMessageDlg.View.FMX.pas
lbl_BodyMessage.FontColor := TAlphaColor(FMXLabelBodyMessage);
```

### B02 — Barra de título
```pascal
// src/FMX/HDMessageDlg.View.FMX.pas
RecLblTitle.Fill.Color := TAlphaColor(FMXColorTop);
PathIconSVG.Fill.Color := FColorSvgIcon;
```
Manter a cor do ícone apenas no `PathIconSVG`.

### B03 — Cores de Message/Question
```pascal
// src/HDMessageDlg.IconsSVG.pas
TiMessage:   Result := CColorSvgMessage;
TiQuestion:  Result := CColorSvgQuestion;
```

### B04 — StyleLookup
Decidir entre:
- adicionar o estilo `btnConfirmacaoCustom` ao StyleBook; ou
- remover o `StyleLookup` e o StyleBook inteiro (ver R03).

### B08 — Dupla execução no Enter
```pascal
if LayoutYes.Visible and (Key = vkReturn) then
begin
  Key := 0;
  SetYes;
  Exit;
end;

if LayoutNo.Visible and (Key = vkEscape) then
begin
  Key := 0;
  SetNo;
end;
```

### C01 — Simplificar `MsgIcon`
```pascal
function THDMessageDlg.MsgIcon(aValue: TIcon): iHDMessageDlg;
begin
  Result            := Self;
  FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
  FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
  FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
end;
```

### C03/C04 — Dependências
- Remover `Data.DB` dos `uses` e `dbrtl` do `.dpk`/`.dproj` (compila sem).
- Em `View.FMX.pas`, remover `Winapi.Windows` e usar `vkReturn`/`vkEscape` de `System.UITypes` (já importado). Testado: compila.

### R01/R03 — Limpeza do `.fmx`
- Remover o objeto `imgMenssage` (e o campo na classe) e o `StyleBook` não utilizado.
- Resultado testado: `.fmx` de **1372,3 KB → 9,3 KB**, pacote compila.
- Remover os `FileName` absolutos junto com o `TImage`.

### R04 — Sample
- Limpar `DCC_UsePackage` para `rtl;fmx`.
- Adicionar `..\src;..\src\FMX` em `DCC_UnitSearchPath`.

## Fluxo de trabalho combinado

1. Escolher um ID do backlog.
2. Apresentar plano + diff resumido e **pedir autorização**.
3. Após aprovação, aplicar somente aquele item.
4. Compilar pacote e/ou sample e reportar o resultado.
5. Atualizar o status do item neste `AGENTS.md` (`Pendente` → `Feito`).
6. Não misturar itens nem alterar API pública sem autorização explícita.

## Decisões já tomadas

- Correções de baixo risco primeiro (B01, B02, B03, B08, C01, C02, C03, C04, R01, R05).
- Renomeações que quebram API (`Backuground`, `TIcon`/`TType`, `iHDMessageDlg`) ficam para uma versão 2.0.
- Não alterar o sample além do necessário para ele compilar/rodar (B05, R04).

## Comandos de validação

```powershell
# Pacote (Win32)
cmd /c '"C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat" && dcc32 -B HDMessageDlg.dpk'

# Sample (quando o pacote não estiver instalado)
cmd /c '"C:\Program Files (x86)\Embarcadero\Studio\23.0\bin\rsvars.bat" && dcc32 -B -U"src;src\FMX" Samples\Samples.dpr'
```

---

# context-mode — MANDATORY routing rules

context-mode MCP tools available. Rules protect context window from flooding. One unrouted command dumps 56 KB into context.

## Think in Code — MANDATORY

Analyze/count/filter/compare/search/parse/transform data: **write code** via `context-mode_ctx_execute(language, code)`, `console.log()` only the answer. Do NOT read raw data into context. PROGRAM the analysis, not COMPUTE it. Pure JavaScript — Node.js built-ins only (`fs`, `path`, `child_process`). `try/catch`, handle `null`/`undefined`. One script replaces ten tool calls.

## BLOCKED — do NOT attempt

### curl / wget — BLOCKED
Shell `curl`/`wget` intercepted and blocked. Do NOT retry.
Use: `context-mode_ctx_fetch_and_index(url, source)` or `context-mode_ctx_execute(language: "javascript", code: "const r = await fetch(...)")`

### Inline HTTP — BLOCKED
`fetch('http`, `requests.get(`, `requests.post(`, `http.get(`, `http.request(` — intercepted. Do NOT retry.
Use: `context-mode_ctx_execute(language, code)` — only stdout enters context

### Direct web fetching — BLOCKED
Use: `context-mode_ctx_fetch_and_index(url, source)` then `context-mode_ctx_search(queries)`

## REDIRECTED — use sandbox

### Shell (>20 lines output)
Shell ONLY for: `git`, `mkdir`, `rm`, `mv`, `cd`, `ls`, `npm install`, `pip install`.
Otherwise: `context-mode_ctx_batch_execute(commands, queries)` or `context-mode_ctx_execute(language: "javascript", code: "...")`. Use `language: "shell"` only when code matches the host shell.

### File reading (for analysis)
Reading to **edit** → reading correct. Reading to **analyze/explore/summarize** → `context-mode_ctx_execute_file(path, language, code)`.

### grep / search (large results)
Use `context-mode_ctx_execute(language: "javascript", code: "...")` in sandbox for portable filtering/counting.

## Tool selection

0. **MEMORY**: `context-mode_ctx_search(sort: "timeline")` — after resume, check prior context before asking user.
1. **GATHER**: `context-mode_ctx_batch_execute(commands, queries)` — runs all commands, auto-indexes, returns search. ONE call replaces 30+. Each command: `{label: "header", command: "..."}`.
2. **FOLLOW-UP**: `context-mode_ctx_search(queries: ["q1", "q2", ...])` — all questions as array, ONE call (default relevance mode).
3. **PROCESSING**: `context-mode_ctx_execute(language, code)` | `context-mode_ctx_execute_file(path, language, code)` — sandbox, only stdout enters context.
4. **WEB**: `context-mode_ctx_fetch_and_index(url, source)` then `context-mode_ctx_search(queries)` — raw HTML never enters context.
5. **INDEX**: `context-mode_ctx_index(content, source)` — store in FTS5 for later search.

## Parallel I/O batches

For multi-URL fetches or multi-API calls, **always** include `concurrency: N` (1-8):

- `context-mode_ctx_batch_execute(commands: [3+ network commands], concurrency: 5)` — gh, curl, dig, docker inspect, multi-region cloud queries
- `context-mode_ctx_fetch_and_index(requests: [{url, source}, ...], concurrency: 5)` — multi-URL batch fetch

**Use concurrency 4-8** for I/O-bound work (network calls, API queries). **Keep concurrency 1** for CPU-bound (npm test, build, lint) or commands sharing state (ports, lock files, same-repo writes).

GitHub API rate-limit: cap at 4 for `gh` calls.

## Output

Write artifacts to FILES — never inline. Return: file path + 1-line description.
Descriptive source labels for `search(source: "label")`.

## Session Continuity

Skills, roles, and decisions persist for the entire session. Do not abandon them as the conversation grows.

## Memory

Session history is persistent and searchable. On resume, search BEFORE asking the user:

| Need | Command |
|------|---------|
| What did we decide? | `context-mode_ctx_search(queries: ["decision"], source: "decision", sort: "timeline")` |
| What constraints exist? | `context-mode_ctx_search(queries: ["constraint"], source: "constraint")` |

DO NOT ask "what were we working on?" — SEARCH FIRST.
If search returns 0 results, proceed as a fresh session.

## ctx commands

| Command | Action |
|---------|--------|
| `ctx stats` | Call `stats` MCP tool, display full output verbatim |
| `ctx doctor` | Call `doctor` MCP tool, run returned shell command, display as checklist |
| `ctx upgrade` | Call `upgrade` MCP tool, run returned shell command, display as checklist |
| `ctx purge` | Call `purge` MCP tool with confirm: true. Warns before wiping knowledge base. |

After /clear or /compact: knowledge base and session stats preserved. Use `ctx purge` to start fresh.
