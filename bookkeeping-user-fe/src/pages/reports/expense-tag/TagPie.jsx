import {useEffect, useState} from "react";
import {useDispatch, useSelector} from "umi";
import { Card } from "antd";
import {radioValueToTimeRange} from "@/utils/util";
import {useResponseData} from "@/utils/hooks";
import Pie from '@/components/charts/Pie2';
import t from '@/utils/translate';

export default () => {

  const loading = useSelector(state => state.loading.effects['expenseTagReports/query']);
  const { queryResponse } = useSelector(state => state.expenseTagReports);
  const [data] = useResponseData(queryResponse);

  return (
    <Card title={t('expense.tag')} bordered={false} bodyStyle={{padding: '40px 10px'}}>
      <Pie data={data} loading={loading} />
    </Card>
  )

}
