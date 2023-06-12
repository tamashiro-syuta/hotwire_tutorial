// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// アプリケーション全体で Turbo Drive を無効化する場合の設定
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false