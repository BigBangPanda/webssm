package org.hanzx.service.impl;

import org.hanzx.entity.User;
import org.hanzx.entity.UserExample;
import org.hanzx.mapper.UserMapper;
import org.hanzx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUser(Integer id) {
        UserExample userExample = new UserExample();
        if (id != null){
            userExample.createCriteria().andIdEqualTo(id);
        }
        return userMapper.selectByExample(userExample);
    }

}
