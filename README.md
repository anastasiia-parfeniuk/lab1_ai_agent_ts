# Лабораторна робота № 1 — AI-агент для розробки та CI/CD

**Варіант:** 6  
**Мова:** TypeScript  
**Тестування:** Vitest  
**Середовище агента:** VS Code + GitHub Copilot

## Мета
Створити спеціалізованого AI-агента з manifest, skills, commands та orchestrator для автоматизації створення, складання, тестування і налаштування CI для кросплатформного Hello World-проєкту.

## Вимоги
- Node.js 22 або сумісна актуальна LTS-версія та npm.
- VS Code з GitHub Copilot Chat для запуску агента.
- Git для роботи з гілками та Pull Request.

## Запуск програми
```bash
npm install
npm run build
npm start
```
Очікуваний вивід:
```text
Hello, World!
```

## Запуск тестів і CI локально
```bash
npm test
```
На Linux/macOS:
```bash
bash ./ci.sh
```
На Windows:
```bat
ci.bat
```

## Запуск AI-агента
1. Відкрий цей каталог у VS Code.
2. Переконайся, що GitHub Copilot Chat активний і використовується правильний GitHub-акаунт.
3. Відкрий режим Agents у Copilot Chat та вибери `Build Engineer` (файл `.github/agents/build-engineer.agent.md`).
4. Щоб запустити повний сценарій, відкрий `.github/prompts/init.prompt.md` і передай інструкцію команді агента: виконай сценарій `init` за цією prompt-інструкцією.
5. Для окремих операцій використовуй prompt-файли з `.github/prompts/`.
6. Переглядай diff перед прийняттям змін. Після змін запусти `npm install`, `npm run build`, `npm test` і перевір `git status`.

> Prompt-файли є інструкціями для Copilot, а не самостійними виконуваними shell-командами. Доступність функцій Agent/Prompt залежить від встановленої версії VS Code та Copilot. Якщо клієнт не показує prompt як команду, відкрий файл і попроси Copilot виконати його інструкції.

## Структура
```text
.github/
  agents/build-engineer.agent.md
  skills/
    project-scaffold/SKILL.md
    build-and-test/SKILL.md
    github-actions/SKILL.md
  prompts/
    git-init.prompt.md
    create-project.prompt.md
    create-build.prompt.md
    create-actions.prompt.md
    check.prompt.md
    init.prompt.md
  workflows/ci.yml
src/
  hello.ts
  math.ts
tests/
  math.test.ts
docs/
  architecture.md
  usage.md
  ai-log.md
ci.sh
ci.bat
package.json
package-lock.json
tsconfig.json
```

## GitHub Actions
Workflow `.github/workflows/ci.yml` запускається на `push` і `pull_request` для `develop`, `master` та `feature/**`. Матриця містить `ubuntu-latest`, `windows-latest`, `macos-latest`. Кожна job встановлює залежності та запускає відповідний CI-скрипт.

Щоб побачити фактичні результати, запуш репозиторій на GitHub і відкрий вкладку **Actions**. Успішний локальний запуск не є доказом успішного віддаленого CI.

## Git-процес для здачі
Перевір узгоджені з викладачем назви базових гілок. Методичка згадує `develop`, `master` і `feature/...` у різних етапах. Зазвичай потрібно створити `develop`, робочу гілку на кшталт `feature/lab1-ai-agent`, зробити змістовні коміти та створити Pull Request з назвою `lab1/finish`. Не зливай зміни в базову гілку до перевірки.

## Перед здачею
- [ ] Агент і всі три skills та шість prompt-команд додані до Git.
- [ ] `npm run build` проходить.
- [ ] `npm test` проходить, включно з `BasicAddition`.
- [ ] `dist/` і `node_modules/` не відстежуються Git.
- [ ] GitHub Actions має успішні запуски для трьох ОС.
- [ ] `docs/ai-log.md` заповнено реальними запитами, помилками й виправленнями.
- [ ] Додано посилання на Pull Request та відео демонстрації.
