import { CDFLogger } from '@cdf/logger/src/index';

const LOG_LEVEL = process.env.LOG_LEVEL || 'info';

// Common logger library instance
export const logger = new CDFLogger(LOG_LEVEL);