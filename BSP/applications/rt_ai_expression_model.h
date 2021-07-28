#ifndef __RT_AI_EXPRESSION_MODEL_H
#define __RT_AI_EXPRESSION_MODEL_H

/* model info ... */

// model name
#define RT_AI_EXPRESSION_MODEL_NAME			"expression"

#define RT_AI_EXPRESSION_WORK_BUFFER_BYTES		(165120)

#define AI_EXPRESSION_DATA_WEIGHTS_SIZE		(729052)

#define RT_AI_EXPRESSION_BUFFER_ALIGNMENT		(4)

#define RT_AI_EXPRESSION_IN_NUM				(1)

#define RT_AI_EXPRESSION_IN_SIZE_BYTES	{	\
	((48 * 48 * 1) * 1),	\
}
#define RT_AI_EXPRESSION_IN_1_SIZE			(48 * 48 * 1)
#define RT_AI_EXPRESSION_IN_1_SIZE_BYTES		((48 * 48 * 1) * 1)
#define RT_AI_EXPRESSION_IN_TOTAL_SIZE_BYTES		((48 * 48 * 1) * 1)



#define RT_AI_EXPRESSION_OUT_NUM				(1)

#define RT_AI_EXPRESSION_OUT_SIZE_BYTES	{	\
	((1 * 1 * 7) * 1),	\
}
#define RT_AI_EXPRESSION_OUT_1_SIZE			(1 * 1 * 7)
#define RT_AI_EXPRESSION_OUT_1_SIZE_BYTES		((1 * 1 * 7) * 1)
#define RT_AI_EXPRESSION_OUT_TOTAL_SIZE_BYTES		((1 * 1 * 7) * 1)




#define RT_AI_EXPRESSION_TOTAL_BUFFER_SIZE		//unused

#endif	//end
