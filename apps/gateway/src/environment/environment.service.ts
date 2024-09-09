import * as fs from 'fs';

export class EnvironmentService {
  constructor() {}

  isDevelopment(appEnv: string): boolean {
    // Check for a .env.development file
    const hasDevEnvFile = fs.existsSync('.env.development.local');

    // Check for a custom APP_ENV variable
    const isAppEnvDevelopment = appEnv === 'development';

    return hasDevEnvFile && isAppEnvDevelopment;
  }
}
