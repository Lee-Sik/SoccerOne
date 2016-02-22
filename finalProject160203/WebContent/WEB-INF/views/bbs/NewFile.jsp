<insert id="bbsLike" parameterType="soccer.co.DTO.foot_like_DTO">
		INSERT INTO FOOT_BBS_LIKE
		(PARENT_BBS_NO, USER_EMAIL) 
		VALUES(#{parent_bbs_no}, #{user_email})
	</insert>
	
	<update id="bbsLikeCount" parameterType="soccer.co.DTO.foot_community_DTO">
		UPDATE FOOT_BBS SET
		GOOD = GOOD+1
		WHERE BBS_NO=#{bbs_no}
	</update>
	
	<delete id="bbsLikeDel" parameterType="soccer.co.DTO.foot_like_DTO">
		DELETE FROM FOOT_BBS_LIKE
		WHERE PARENT_BBS_NO = #{parent_bbs_no}
		AND USER_EMAIL = #{user_email}
	</delete>
	
	<update id="bbsLikeCountDel" parameterType="soccer.co.DTO.foot_community_DTO">
		UPDATE FOOT_BBS SET
		GOOD = GOOD-1
		WHERE BBS_NO=#{bbs_no}
	</update>
	
	<select id="getLike" parameterType="soccer.co.DTO.foot_like_DTO" resultType="soccer.co.DTO.foot_like_DTO">
			SELECT *
			FROM FOOT_BBS_LIKE
			WHERE PARENT_BBS_NO=#{parent_bbs_no}
			AND USER_EMAIL=#{user_email}
	</select>