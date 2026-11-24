import { readFileSync, writeFileSync } from 'node:fs';
import { DatabaseSync } from 'node:sqlite';

const sql = readFileSync(new URL('./catalog.sql', import.meta.url), 'utf8');
const pagePath = new URL('./index.html', import.meta.url);
const database = new DatabaseSync(':memory:');
database.exec(sql);

const titles = database.prepare(`
  SELECT category, chart_rank AS rank, title, alternate_title AS alternateTitle,
         release_year AS year, format, score, source_id AS sourceId
  FROM titles
  ORDER BY category DESC, chart_rank
`).all();
database.close();

const page = readFileSync(pagePath, 'utf8');
const dataBlock = /(<script type="application\/json" id="catalog-data">)[\s\S]*?(<\/script>)/;
if (!dataBlock.test(page)) throw new Error('Catalog data block is missing.');

const rows = titles.map(title => '  ' + JSON.stringify(title).replaceAll('<', '\\u003c'));
writeFileSync(pagePath, page.replace(dataBlock, (_, open, close) =>
  open + '\n[\n' + rows.join(',\n') + '\n]\n' + close
));
